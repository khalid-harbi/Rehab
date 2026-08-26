-- ============================================================
-- جدول اهتمامات المستثمرين — يستقبل نموذج «سجّل اهتمامك»
-- في اللاندينج بيج. شغّليه من Supabase Dashboard > SQL Editor
-- ============================================================

create table if not exists public.investor_leads (
  id            bigint generated always as identity primary key,
  name          text        not null,
  email         text        not null,
  organization  text,
  message       text,
  -- من أين جاء الـ lead (اسم الصفحة أو الحملة)
  source        text        not null default 'landing',
  created_at    timestamptz not null default now()
);

create index if not exists investor_leads_created_at_idx
  on public.investor_leads (created_at desc);

-- ============================================================
-- RLS: الزوّار يكتبون فقط — ولا أحد يقرأ بالمفتاح العلني
-- ============================================================

alter table public.investor_leads enable row level security;

-- الإدخال مسموح للزائر، لكن بشروط تمنع البيانات العشوائية.
-- التحقق هنا في قاعدة البيانات وليس في المتصفح فقط، لأن المتصفح
-- يمكن تجاوزه — أي طلب يخالف الشروط يُرفض من Supabase نفسه.
drop policy if exists "investor_leads_public_insert" on public.investor_leads;
create policy "investor_leads_public_insert"
  on public.investor_leads
  for insert
  to anon
  with check (
    char_length(trim(name)) between 2 and 120
    and email ~* '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]{2,}$'
    and char_length(coalesce(organization, '')) <= 160
    and char_length(coalesce(message, ''))      <= 2000
    and char_length(coalesce(source, ''))       <= 60
  );

-- ملاحظة مهمة: لا توجد سياسة SELECT عمدًا.
-- بدونها لا يستطيع أحد قراءة بيانات المستثمرين بالمفتاح العلني،
-- حتى لو استخرجه من كود الصفحة. تقرأينها أنتِ من لوحة تحكم Supabase.
