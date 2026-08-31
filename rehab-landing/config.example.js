// ============================================================
//  إعدادات الاتصال بـ Supabase
//
//  تُملأ القيمتان من:
//  Supabase Dashboard > Project Settings > API
//
//  المفتاح anon مصمَّم ليكون علنيًا في المتصفح، وهذا طبيعي —
//  الحماية الحقيقية في سياسات RLS داخل قاعدة البيانات،
//  انظري supabase/partner_leads.sql.
//  لا يُوضع هنا مفتاح service_role إطلاقًا.
//
//  هذا الملف محجوب في .gitignore فلا يُرفع للمستودع.
// ============================================================

window.REHAB_CONFIG = {
  supabaseUrl: "https://YOUR-PROJECT-REF.supabase.co",
  supabaseAnonKey: "YOUR-ANON-KEY",
};
