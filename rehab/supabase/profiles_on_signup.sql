-- ===========================================================================
--  إنشاء صف profiles تلقائيًا لكل حساب جديد
-- ===========================================================================
--
--  المشكلة: التطبيق كان ينشئ الحساب في auth.users فقط، فيبقى جدول profiles
--  فارغًا. والنتيجة:
--    • اسم المستخدمة يظهر «زائر» (قيمة احتياطية في ProfileRemoteDataSource)
--    • الحساب بلا role، فلا يصل المالك إلى لوحته أبدًا
--    • تسجيل الدخول كان يفشل لأن getLogin يقرأ role من صف غير موجود
--
--  auth.users جدول نظام في Supabase ولا يمكن الكتابة فيه من العميل، لذلك
--  الطريقة المعيارية هي trigger يعمل بـ security definer: يتجاوز RLS،
--  ويعمل مع أي مسار تسجيل (التطبيق، لوحة Supabase، مزوّد خارجي)، ويعمل حتى
--  مع تفعيل تأكيد البريد حيث لا توجد جلسة بعد التسجيل.
--
--  الاسم يصل من التطبيق عبر `data: {'name': name}` في auth.signUp،
--  فيُخزَّن في raw_user_meta_data ويقرأه هذا الـ trigger.
--
--  التشغيل: Supabase Dashboard ← SQL Editor ← الصق الملف ← Run
-- ===========================================================================


-- ــــــ 1. الدالة ــــــ

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  -- الأعمدة الأربعة فقط هي المؤكدة في المخطّط (تقرأها ProfileModel و
  -- UsersModel). عمود email غير مقروء في أي مكان من التطبيق وقد لا يكون
  -- موجودًا أصلًا — وإدخال عمود غير موجود هنا يُفشل كل تسجيل جديد،
  -- لأن فشل الـ trigger يُلغي إنشاء الحساب في auth.users نفسه.
  insert into public.profiles (id, name, role, created_at)
  values (
    new.id,

    -- الاسم المُدخل في التسجيل، وإلا الجزء الأول من البريد،
    -- وإلا «زائر» (حسابات الدخول المجهول بلا بريد).
    coalesce(
      nullif(trim(new.raw_user_meta_data ->> 'name'), ''),
      nullif(split_part(coalesce(new.email, ''), '@', 1), ''),
      'زائر'
    ),

    -- الدور الافتراضي مستخدمة. ترقية أي حساب إلى مالك تتم يدويًا:
    --   update public.profiles set role = 'owner'
    --   where id = (select id from auth.users where email = '...');
    coalesce(nullif(trim(new.raw_user_meta_data ->> 'role'), ''), 'user'),

    now()
  )
  on conflict (id) do nothing;

  return new;
end;
$$;


-- ــــــ 2. الـ trigger ــــــ

drop trigger if exists on_auth_user_created on auth.users;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();


-- ــــــ 3. ترميم الحسابات القديمة ــــــ
--
--  كل حساب أُنشئ قبل هذا الإصلاح لا صف له في profiles: اسمه «زائر» ولا
--  يستطيع تسجيل الدخول. هذا السطر ينشئ الصفوف الناقصة دفعة واحدة.

insert into public.profiles (id, name, role, created_at)
select
  u.id,
  coalesce(
    nullif(trim(u.raw_user_meta_data ->> 'name'), ''),
    nullif(split_part(coalesce(u.email, ''), '@', 1), ''),
    'زائر'
  ),
  'user',
  coalesce(u.created_at, now())
from auth.users u
left join public.profiles p on p.id = u.id
where p.id is null
on conflict (id) do nothing;


-- ===========================================================================
--  اختياري: سياسة RLS للإدخال من التطبيق
-- ===========================================================================
--
--  الـ trigger أعلاه يكفي، وهذه السياسة تفعّل شبكة الأمان الإضافية في
--  SignUpRemoteDataSource._ensureProfile فقط.
--
--  ⚠️ لا تُشغّلي سطر `enable row level security` إن كان RLS معطّلًا حاليًا على
--  الجدول ولم تُعرَّف سياسة select — تفعيله بلا سياسة قراءة يحجب كل البيانات
--  عن التطبيق فورًا. تحقّقي من السياسات الموجودة أولًا:
--
--    select policyname, cmd from pg_policies where tablename = 'profiles';
--
-- alter table public.profiles enable row level security;
--
-- create policy "profiles_insert_own"
--   on public.profiles for insert to authenticated
--   with check (auth.uid() = id);


-- ===========================================================================
--  ملاحظة: عمود email
-- ===========================================================================
--
--  إن كان جدولك يحتوي عمود email وتريدينه ممتلئًا، أضيفي `email` إلى قائمة
--  الأعمدة و `new.email` إلى القيم في الدالة أعلاه (و `u.email` في الترميم).
--  تحقّقي من الأعمدة الموجودة أولًا:
--
--    select column_name, is_nullable, column_default
--    from information_schema.columns
--    where table_schema = 'public' and table_name = 'profiles';
