-- ============================================================
--  رحاب — جدول طلبات الانضمام
--  يُشغَّل من: Supabase Dashboard > SQL Editor > New query
--  آمن للتشغيل أكثر من مرة.
--
--  تستقبل الاستمارة في الصفحة التعريفية ثلاث صفات:
--    seeker   → باحثة عن سكن (قائمة الانتظار — جانب الطلب)
--    owner    → مالك عقار يرغب في عرض وحدته
--    investor → مهتم بالاستثمار في رحاب
--  الحقول المشتركة أعلى الجدول، وحقول كل صفة تحتها.
-- ============================================================


-- ------------------------------------------------------------
-- 1) قوائم الخيارات كأنواع (enums)
--    فائدتها: قاعدة البيانات ترفض أي قيمة خارج القائمة، فما
--    يوصلك سطر بقيمة عشوائية من متصفح متلاعب.
-- ------------------------------------------------------------

do $$ begin
  create type lead_kind as enum ('seeker', 'investor', 'owner');
exception when duplicate_object then null; end $$;

-- لو كان النوع موجودًا سلفًا بقيمتين فقط، تُضاف الصفة الثالثة
alter type lead_kind add value if not exists 'seeker' before 'investor';

-- --- خاصة بالباحثة عن سكن ---

do $$ begin
  create type housing_pref as enum (
    'private',   -- وحدة خاصة
    'shared',    -- سكن مشترك
    'either'     -- كلاهما مقبول
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type move_in_window as enum (
    'now',        -- في أقرب وقت
    'within_1m',  -- خلال شهر
    'within_3m',  -- خلال ثلاثة أشهر
    'flexible'    -- الموعد مرن
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type seeker_occupation as enum (
    'student',   -- طالبة
    'employed',  -- موظفة
    'both',      -- طالبة وموظفة
    'other'      -- غير ذلك
  );
exception when duplicate_object then null; end $$;

-- --- خاصة بالمستثمر ---

do $$ begin
  create type investor_kind as enum (
    'individual',    -- مستثمر فرد
    'angel',         -- مستثمر ملائكي
    'vc',            -- صندوق استثمار جريء
    'family_office', -- مكتب عائلي
    'company',       -- شركة / مستثمر استراتيجي
    'accelerator',   -- حاضنة أو مسرّعة أعمال
    'other'          -- أخرى
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type ticket_band as enum (
    'under_100k', '100k_500k', '500k_1m', '1m_5m', 'over_5m', 'undecided'
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type engagement_horizon as enum (
    'now', 'within_3m', 'within_6m', 'exploring'
  );
exception when duplicate_object then null; end $$;

-- --- خاصة بصاحب العقار ---

do $$ begin
  create type portfolio_band as enum (
    'one',        -- عقار واحد
    'two_five',   -- ٢ – ٥
    'six_ten',    -- ٦ – ١٠
    'over_ten'    -- أكثر من ١٠
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type listing_readiness as enum (
    'ready_now',    -- جاهز أنشر الآن
    'within_month', -- خلال شهر
    'later',        -- لاحقًا
    'exploring'     -- أستفسر فقط
  );
exception when duplicate_object then null; end $$;


-- ------------------------------------------------------------
-- 2) الجدول
-- ------------------------------------------------------------

create table if not exists public.partner_leads (
  id             bigint generated always as identity primary key,

  -- نوع الطلب: هو اللي يحدد أي الحقول التالية مطلوبة
  lead_type      lead_kind not null,

  -- --- مشترك بين الصفات الثلاث ---
  full_name      text not null,
  email          text not null,
  phone          text,
  city           text,
  message        text,

  -- --- حقول المستثمر (تبقى فارغة لصاحب العقار) ---
  organization   text,
  job_title      text,
  investor_type  investor_kind,
  ticket_size    ticket_band,
  horizon        engagement_horizon,
  interest_areas text[] not null default '{}',
  link           text,   -- موقع أو لينكدإن

  -- --- حقول الباحثة عن سكن (تبقى فارغة لغيرها) ---
  housing_preference housing_pref,
  move_in            move_in_window,
  occupation         seeker_occupation,
  budget_monthly     numeric(10,2),   -- الميزانية الشهرية بالريال

  -- --- حقول مالك العقار (تبقى فارغة لغيره) ---
  -- الحي مشترك بين الباحثة والمالك: المطلوب في حالتها، والمعروض في حالته
  district         text,
  properties_count portfolio_band,
  -- أنواع السكن المعروضة: نفس تصنيف التطبيق
  -- private_apartment | shared_apartment | room_in_shared | whole_unit
  property_types   text[] not null default '{}',
  rooms_available  integer,
  monthly_price    numeric(10,2),   -- السعر الشهري التقريبي بالريال
  readiness        listing_readiness,

  -- --- موافقة صريحة على التواصل (نظام حماية البيانات الشخصية) ---
  consent        boolean not null default false,

  -- --- ميتاداتا ---
  source         text not null default 'landing',
  locale         text not null default 'ar',
  status         text not null default 'new',  -- new | contacted | qualified | passed
  created_at     timestamptz not null default now(),

  -- كل صفة تلتزم بحقولها: يُرفض طلب "مستثمر" بلا صفة مستثمر،
  -- و"مالك عقار" بلا جاهزية للعرض، و"باحثة" بلا نوع سكن مطلوب.
  constraint partner_leads_shape check (
    case lead_type::text
      when 'seeker' then
        housing_preference is not null
        and move_in is not null
      when 'investor' then
        investor_type is not null
        and ticket_size is not null
        and horizon    is not null
        and coalesce(array_length(interest_areas, 1), 0) between 1 and 8
      when 'owner' then
        properties_count is not null
        and readiness    is not null
        and coalesce(array_length(property_types, 1), 0) between 1 and 4
    end
  )
);


-- ------------------------------------------------------------
-- 3) فهارس — للفرز في لوحة التحكم
-- ------------------------------------------------------------

create index if not exists partner_leads_created_at_idx
  on public.partner_leads (created_at desc);

create index if not exists partner_leads_triage_idx
  on public.partner_leads (lead_type, status, created_at desc);

-- بريد واحد لا يتكرر داخل الصفة نفسها، ويجوز للشخص ذاته
-- أن يسجّل بصفتين مختلفتين.
create unique index if not exists partner_leads_email_unique_idx
  on public.partner_leads (lead_type, lower(trim(email)));


-- ------------------------------------------------------------
-- 4) نقل بيانات الجدول القديم investor_leads إن كان موجودًا
--    نسخ فقط — لا نحذف الجدول القديم، احذفيه بنفسك متى ما تأكدتِ.
-- ------------------------------------------------------------

do $$ begin
  if exists (
    select 1 from information_schema.tables
    where table_schema = 'public' and table_name = 'investor_leads'
  ) then
    insert into public.partner_leads
      (lead_type, full_name, email, organization, message, source, created_at,
       investor_type, ticket_size, horizon, interest_areas, consent)
    select
      'investor',
      coalesce(nullif(trim(l.name), ''), 'غير محدد'),
      l.email,
      l.organization,
      l.message,
      coalesce(l.source, 'landing'),
      l.created_at,
      'other', 'undecided', 'exploring', array['capital'], true
    from public.investor_leads l
    on conflict do nothing;
  end if;
exception when undefined_column then
  -- الجدول القديم بأعمدة مختلفة — تخطّي النقل بدل الفشل
  null;
end $$;


-- ------------------------------------------------------------
-- 5) RLS — الزائر يكتب فقط، ولا أحد يقرأ بالمفتاح العلني
-- ------------------------------------------------------------

alter table public.partner_leads enable row level security;

drop policy if exists "partner_leads_public_insert" on public.partner_leads;
create policy "partner_leads_public_insert"
  on public.partner_leads
  for insert
  to anon
  with check (
    char_length(trim(full_name)) between 2 and 120
    and email ~* '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]{2,}$'
    and char_length(coalesce(phone, ''))        <= 32
    and char_length(coalesce(city, ''))         <= 80
    and char_length(coalesce(district, ''))     <= 80
    and char_length(coalesce(organization, '')) <= 160
    and char_length(coalesce(job_title, ''))    <= 120
    and char_length(coalesce(link, ''))         <= 300
    and char_length(coalesce(message, ''))      <= 2000
    and (rooms_available is null or rooms_available between 1 and 100)
    and (monthly_price   is null or monthly_price   between 0 and 1000000)
    and (budget_monthly  is null or budget_monthly  between 0 and 1000000)
    -- لا نقبل تسجيلًا بدون موافقة صريحة على التواصل
    and consent = true
    -- الزائر لا يحدد حالة المتابعة، تبدأ دائمًا new
    and status = 'new'
    and char_length(coalesce(source, '')) <= 60
  );

-- ملاحظة مقصودة: لا توجد سياسة SELECT للزائر. بدونها لا يقدر أحد
-- يقرأ الطلبات بالمفتاح العلني حتى لو استخرجه من كود الصفحة —
-- تقرأينها أنتِ من لوحة تحكم Supabase.


-- ------------------------------------------------------------
-- 6) واجهات قراءة مرتّبة لكِ في لوحة التحكم
-- ------------------------------------------------------------

-- المستثمرون، مرتّبون حسب حجم التذكرة ثم الجاهزية الزمنية
create or replace view public.investor_leads_triage as
select
  id, created_at, full_name, email, phone, city,
  organization, job_title, investor_type, ticket_size, horizon,
  interest_areas, link, message, status,
  (case ticket_size
     when 'over_5m'    then 5 when '1m_5m'     then 4
     when '500k_1m'    then 3 when '100k_500k' then 2
     when 'under_100k' then 1 else 0 end)
  +
  (case horizon
     when 'now' then 3 when 'within_3m' then 2
     when 'within_6m' then 1 else 0 end) as priority
from public.partner_leads
where lead_type::text = 'investor'
order by priority desc, created_at desc;

-- الملّاك، مرتّبون حسب حجم المحفظة ثم جاهزية النشر
create or replace view public.owner_leads_triage as
select
  id, created_at, full_name, email, phone, city, district,
  properties_count, property_types, rooms_available, monthly_price,
  readiness, message, status,
  (case properties_count
     when 'over_ten' then 4 when 'six_ten' then 3
     when 'two_five' then 2 when 'one'     then 1 else 0 end)
  +
  (case readiness
     when 'ready_now'    then 3 when 'within_month' then 2
     when 'later'        then 1 else 0 end) as priority
from public.partner_leads
where lead_type::text = 'owner'
order by priority desc, created_at desc;


-- الباحثات عن سكن — قائمة الانتظار، الأقرب حاجةً أولًا
create or replace view public.seeker_leads_triage as
select
  id, created_at, full_name, email, phone,
  city, district, housing_preference, move_in, occupation,
  budget_monthly, message, status,
  (case move_in
     when 'now'       then 3 when 'within_1m' then 2
     when 'within_3m' then 1 else 0 end) as urgency
from public.partner_leads
where lead_type::text = 'seeker'
order by urgency desc, created_at desc;


-- ------------------------------------------------------------
-- 7) ملخّص الطلب — يختصر قائمة الانتظار في أرقام تُعرض على المستثمرين
-- ------------------------------------------------------------

create or replace view public.demand_summary as
select
  city,
  count(*)                                                as seekers,
  count(*) filter (where housing_preference = 'shared')   as want_shared,
  count(*) filter (where housing_preference = 'private')  as want_private,
  count(*) filter (where move_in in ('now', 'within_1m')) as urgent,
  round(avg(budget_monthly))                              as avg_budget
from public.partner_leads
where lead_type::text = 'seeker'
group by city
order by seekers desc;
