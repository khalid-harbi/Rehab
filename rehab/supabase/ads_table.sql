-- ============================================================
-- جدول الإعلانات (البانرات المتحركة في صفحة الهوم)
-- شغّليه من Supabase Dashboard > SQL Editor
-- ============================================================

create table if not exists public.ads (
  id           bigint generated always as identity primary key,
  title_ar     text        not null default '',
  title_en     text        not null default '',
  subtitle_ar  text        not null default '',
  subtitle_en  text        not null default '',
  image_url    text        not null default '',
  -- رابط خارجي يُفتح عند الضغط على الإعلان (اختياري)
  action_url   text,
  -- أو ربط الإعلان بعقار موجود، فيفتح صفحة تفاصيله عند الضغط (اختياري)
  home_id      bigint      references public.home(id) on delete set null,
  is_active    boolean     not null default true,
  sort_order   integer     not null default 0,
  starts_at    timestamptz,
  ends_at      timestamptz,
  created_at   timestamptz not null default now()
);

create index if not exists ads_active_order_idx
  on public.ads (is_active, sort_order);

-- ============================================================
-- RLS: الجميع يقرأ الإعلانات الفعّالة، والكتابة للأدمن فقط
-- ============================================================

alter table public.ads enable row level security;

drop policy if exists "ads_public_read" on public.ads;
create policy "ads_public_read"
  on public.ads
  for select
  using (
    is_active = true
    and (starts_at is null or starts_at <= now())
    and (ends_at   is null or ends_at   >= now())
  );

-- ============================================================
-- بيانات تجريبية — احذفيها أو بدّلي الصور بصورك
-- ============================================================

insert into public.ads
  (title_ar, title_en, subtitle_ar, subtitle_en, image_url, sort_order)
values
  ('خصم ٢٠٪ على أول حجز', '20% off your first booking',
   'استخدمي الكود REHAB20', 'Use code REHAB20',
   'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1200', 1),
  ('سكن مشترك يناسبك', 'Shared housing that fits you',
   'جربي مطابقة نمط الحياة', 'Try lifestyle matching',
   'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200', 2),
  ('عقارات جديدة كل أسبوع', 'New listings every week',
   'تصفحي أحدث الإضافات', 'Browse the latest additions',
   'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1200', 3);
