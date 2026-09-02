-- ===========================================================================
--  عقارات تجريبية لصفحة المستخدمة — من دليل المتدرب الجديد (أكاديمية طويق)
-- ===========================================================================
--
--  المصدر: قسم «خصومات لطلاب وطالبات أكاديمية طويق»، صفحات 11–13 من الدليل.
--  الأسماء والأحياء مأخوذة من الملف حرفيًا، والإحداثيات من روابط الخرائط
--  المضمّنة فيه.
--
--  ⚠️ ما هو حقيقي وما هو تجريبي — اقرئيه قبل التشغيل:
--
--   • الأسماء والأحياء والمدينة .......... من الملف (حقيقية)
--   • الإحداثيات المعلَّمة «دقيقة» ......... من روابط خرائط جوجل في الملف
--   • الإحداثيات المعلَّمة «تقريبية» ....... مركز الحي، لا موقع المبنى
--   • صور s3.boudl.work ................. رسمية من موقع مجموعة بودل
--   • صور images.unsplash.com ........... صور عامة بترخيص حر، وليست صور
--                                          العقار الفعلي
--   • السعر والغرف والحمامات والمساحة
--     والتقييم والوصف والمرافق والسياسات .. قيم تجريبية من تأليفنا، غير
--                                          واردة في المصدر إطلاقًا
--
--  ملاحظة: روابط الخرائط داخل الدليل نفسه غير متطابقة أحيانًا (رابط «بودل
--  الوادي» يشير إلى موقع بودل المونسية، و«عابر الصحافة» إلى عابر الياسمين)،
--  فاعتُمد الحي من اسم العقار في هاتين الحالتين.
--
--  التشغيل: Supabase Dashboard ← SQL Editor ← الصق ← Run
-- ===========================================================================


-- ــــــ 1. حسابك المالك ــــــ
--
--  البريد مضبوط على lolo@gmail.com في موضع واحد أدناه. لا بد أن يكون
--  للحساب صف في profiles (شغّلي profiles_on_signup.sql أولًا إن لم تفعلي).


-- ــــــ 2. الإدخال ــــــ

with o as (
  select p.id
  from public.profiles p
  join auth.users u on u.id = p.id
  where u.email = 'lolo@gmail.com'   -- ←←← حساب المالك
  limit 1
)
insert into public.home (
  owner_id, title_ar, title_en,
  city_ar, city_en, district_ar, district_en,
  description_ar, description_en,
  property_type_ar, property_type_en,
  policy_ar, policy_en,
  amenities_ar, amenities_en,
  image_url, image_urls,
  price, rating, rooms, bathrooms, is_available, area, lat, lng
)
select o.id, v.*
from o
cross join (values
  -- فندق سفن جاردنز النرجس | إحداثيات تقريبية على مستوى الحي
  ('فندق سفن جاردنز النرجس', 'Seven Gardens Hotel Al Narjis',
   'الرياض', 'Riyadh', 'النرجس', 'An Narjis',
   'فندق سفن جاردنز النرجس في حي النرجس بالرياض — فندق بمساحة 95 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Seven Gardens Hotel Al Narjis in An Narjis, Riyadh — hotel of 95 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1200&q=80']::text[],
   5200, 4.4, 2, 2, true, 95, 24.853, 46.642),

  -- لؤلؤة النرجس | إحداثيات تقريبية على مستوى الحي
  ('لؤلؤة النرجس', 'Pearl Al Narjis',
   'الرياض', 'Riyadh', 'النرجس', 'An Narjis',
   'لؤلؤة النرجس في حي النرجس بالرياض — شقة مفروشة بمساحة 80 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Pearl Al Narjis in An Narjis, Riyadh — furnished apartment of 80 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=1200&q=80']::text[],
   4300, 4.2, 2, 1, true, 80, 24.8515, 46.6405),

  -- فندق أوليان | إحداثيات تقريبية على مستوى الحي
  ('فندق أوليان', 'Olian Hotel',
   'الرياض', 'Riyadh', 'الياسمين', 'Alyasmin',
   'فندق أوليان في حي الياسمين بالرياض — فندق بمساحة 65 م² و1 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Olian Hotel in Alyasmin, Riyadh — hotel of 65 m² with 1 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=1200&q=80']::text[],
   4800, 4.3, 1, 1, true, 65, 24.832, 46.639),

  -- فندق سوبر 8 | إحداثيات تقريبية على مستوى الحي
  ('فندق سوبر 8', 'Super 8 by Wyndham Al Riyadh',
   'الرياض', 'Riyadh', 'قرطبة', 'Qurtubah',
   'فندق سوبر 8 في حي قرطبة بالرياض — فندق بمساحة 55 م² و1 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Super 8 by Wyndham Al Riyadh in Qurtubah, Riyadh — hotel of 55 m² with 1 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1590490360182-c33d57733427?w=1200&q=80']::text[],
   3600, 4.0, 1, 1, true, 55, 24.806, 46.758),

  -- فندق بريرا قرطبة | إحداثيات تقريبية على مستوى الحي
  ('فندق بريرا قرطبة', 'Braira Qurtubah Hotel',
   'الرياض', 'Riyadh', 'قرطبة', 'Qurtubah',
   'فندق بريرا قرطبة في حي قرطبة بالرياض — فندق بمساحة 130 م² و3 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Braira Qurtubah Hotel in Qurtubah, Riyadh — hotel of 130 m² with 3 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://s3.boudl.work/hotels/optimized-medium/01K6Z4MHRKM7DS6PT00EYA53B4.webp', ARRAY['https://s3.boudl.work/hotels/optimized-medium/01K6Z4MHRKM7DS6PT00EYA53B4.webp']::text[],
   7400, 4.7, 3, 2, true, 130, 24.806, 46.758),

  -- فندق كوبارد | إحداثيات تقريبية على مستوى الحي
  ('فندق كوبارد', 'Coupard Hotel',
   'الرياض', 'Riyadh', 'النرجس', 'An Narjis',
   'فندق كوبارد في حي النرجس بالرياض — فندق بمساحة 90 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Coupard Hotel in An Narjis, Riyadh — hotel of 90 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1200&q=80']::text[],
   5600, 4.4, 2, 2, true, 90, 24.8545, 46.645),

  -- فندق بودل المونسية | إحداثيات تقريبية على مستوى الحي
  ('فندق بودل المونسية', 'Boudl Al Munsiyah Hotel',
   'الرياض', 'Riyadh', 'المونسية', 'Al Munsiyah',
   'فندق بودل المونسية في حي المونسية بالرياض — فندق بمساحة 85 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Boudl Al Munsiyah Hotel in Al Munsiyah, Riyadh — hotel of 85 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://s3.boudl.work/hotels/optimized-medium/01K79BRVTKYCEXT4QTXPP2KNDY.webp', ARRAY['https://s3.boudl.work/hotels/optimized-medium/01K79BRVTKYCEXT4QTXPP2KNDY.webp']::text[],
   5100, 4.5, 2, 1, true, 85, 24.825, 46.806),

  -- فندق بودل الوادي | إحداثيات تقريبية على مستوى الحي
  ('فندق بودل الوادي', 'Boudl Al Wadi Hotel',
   'الرياض', 'Riyadh', 'الوادي', 'Al Wadi',
   'فندق بودل الوادي في حي الوادي بالرياض — فندق بمساحة 80 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Boudl Al Wadi Hotel in Al Wadi, Riyadh — hotel of 80 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://s3.boudl.work/hotels/optimized-medium/01KCNRC1EYJ4E5AJGVGMRJSJQQ.webp', ARRAY['https://s3.boudl.work/hotels/optimized-medium/01KCNRC1EYJ4E5AJGVGMRJSJQQ.webp']::text[],
   4900, 4.4, 2, 1, true, 80, 24.786, 46.656),

  -- هيلتون الرياض | إحداثيات تقريبية على مستوى الحي
  ('هيلتون الرياض', 'Hilton Riyadh Hotel & Residences',
   'الرياض', 'Riyadh', 'غرناطة', 'Ghirnatah',
   'هيلتون الرياض في حي غرناطة بالرياض — فندق بمساحة 160 م² و3 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Hilton Riyadh Hotel & Residences in Ghirnatah, Riyadh — hotel of 160 m² with 3 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=1200&q=80']::text[],
   12500, 4.8, 3, 3, true, 160, 24.777, 46.78),

  -- عابر الياسمين | إحداثيات تقريبية على مستوى الحي
  ('عابر الياسمين', 'Aber Al Yasmeen Hotel',
   'الرياض', 'Riyadh', 'الياسمين', 'Alyasmin',
   'عابر الياسمين في حي الياسمين بالرياض — شقة مفروشة بمساحة 75 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Aber Al Yasmeen Hotel in Alyasmin, Riyadh — furnished apartment of 75 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://s3.boudl.work/hotels/optimized-medium/01K92CA02BAWMF070D0FN85NCK.webp', ARRAY['https://s3.boudl.work/hotels/optimized-medium/01K92CA02BAWMF070D0FN85NCK.webp']::text[],
   4500, 4.3, 2, 1, true, 75, 24.832, 46.639),

  -- عابر الصحافة | إحداثيات تقريبية على مستوى الحي
  ('عابر الصحافة', 'Aber Al Sahafah Hotel',
   'الرياض', 'Riyadh', 'الصحافة', 'As Sahafah',
   'عابر الصحافة في حي الصحافة بالرياض — شقة مفروشة بمساحة 78 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Aber Al Sahafah Hotel in As Sahafah, Riyadh — furnished apartment of 78 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://s3.boudl.work/hotels/optimized-medium/01K6ZB93Y84629W5FCQY88PSJX.webp', ARRAY['https://s3.boudl.work/hotels/optimized-medium/01K6ZB93Y84629W5FCQY88PSJX.webp']::text[],
   4600, 4.3, 2, 1, true, 78, 24.81, 46.642),

  -- شقق روعة النرجس | إحداثيات تقريبية على مستوى الحي
  ('شقق روعة النرجس', 'Rawaa Al Narjis Apartments',
   'الرياض', 'Riyadh', 'النرجس', 'An Narjis',
   'شقق روعة النرجس في حي النرجس بالرياض — شقة مفروشة بمساحة 88 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Rawaa Al Narjis Apartments in An Narjis, Riyadh — furnished apartment of 88 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1200&q=80']::text[],
   4100, 4.1, 2, 2, true, 88, 24.85, 46.643),

  -- راس الهامة - حطين | إحداثيات دقيقة من رابط الخريطة
  ('راس الهامة - حطين', 'Ras Al Hamah - Hittin',
   'الرياض', 'Riyadh', 'حطين', 'Hittin',
   'راس الهامة - حطين في حي حطين بالرياض — شقة مفروشة بمساحة 95 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Ras Al Hamah - Hittin in Hittin, Riyadh — furnished apartment of 95 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200&q=80']::text[],
   5300, 4.2, 2, 2, true, 95, 24.770918, 46.620136),

  -- راس الهامة - غرناطة | إحداثيات دقيقة من رابط الخريطة
  ('راس الهامة - غرناطة', 'Ras Al Hamah - Ghirnatah',
   'الرياض', 'Riyadh', 'غرناطة', 'Ghirnatah',
   'راس الهامة - غرناطة في حي غرناطة بالرياض — شقة مفروشة بمساحة 82 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Ras Al Hamah - Ghirnatah in Ghirnatah, Riyadh — furnished apartment of 82 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=1200&q=80']::text[],
   4700, 4.1, 2, 1, true, 82, 24.775427, 46.832222),

  -- هامة الخليج - طريق الشيخ جابر | إحداثيات دقيقة من رابط الخريطة
  ('هامة الخليج - طريق الشيخ جابر', 'Hamat Al Khaleej - Sheikh Jaber Rd',
   'الرياض', 'Riyadh', 'الملقا', 'Al Malqa',
   'هامة الخليج - طريق الشيخ جابر في حي الملقا بالرياض — شقة مفروشة بمساحة 90 م² و2 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Hamat Al Khaleej - Sheikh Jaber Rd in Al Malqa, Riyadh — furnished apartment of 90 m² with 2 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=1200&q=80']::text[],
   5000, 4.2, 2, 2, true, 90, 24.800547, 46.762245),

  -- فن الفخامة - طريق النخيل | إحداثيات دقيقة من رابط الخريطة
  ('فن الفخامة - طريق النخيل', 'Fan Al Fakhamah - Al Nakheel Rd',
   'الرياض', 'Riyadh', 'الياسمين', 'Alyasmin',
   'فن الفخامة - طريق النخيل في حي الياسمين بالرياض — شقة مفروشة بمساحة 60 م² و1 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Fan Al Fakhamah - Al Nakheel Rd in Alyasmin, Riyadh — furnished apartment of 60 m² with 1 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=1200&q=80']::text[],
   4400, 4.0, 1, 1, true, 60, 24.7226408, 46.8414837),

  -- رشاه للشقق المفروشة | إحداثيات دقيقة من رابط الخريطة
  ('رشاه للشقق المفروشة', 'Rashah Furnished Apartments',
   'الرياض', 'Riyadh', 'قرطبة', 'Qurtubah',
   'رشاه للشقق المفروشة في حي قرطبة بالرياض — شقة مفروشة بمساحة 58 م² و1 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Rashah Furnished Apartments in Qurtubah, Riyadh — furnished apartment of 58 m² with 1 room(s), part of the Tuwaiq Academy discount list.',
   'شقة مفروشة', 'Furnished apartment',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=1200&q=80']::text[],
   3900, 4.0, 1, 1, true, 58, 24.8350789, 46.7339782),

  -- أوبن هوتيل | إحداثيات تقريبية على مستوى الحي
  ('أوبن هوتيل', 'Open Hotel',
   'الرياض', 'Riyadh', 'قرطبة', 'Qurtubah',
   'أوبن هوتيل في حي قرطبة بالرياض — فندق بمساحة 62 م² و1 غرفة، ضمن قائمة خصومات أكاديمية طويق.',
   'Open Hotel in Qurtubah, Riyadh — hotel of 62 m² with 1 room(s), part of the Tuwaiq Academy discount list.',
   'فندق', 'Hotel',
   ARRAY['يمنع التدخين داخل الوحدة', 'الهوية الوطنية مطلوبة عند التسجيل', 'خصم لمتدربات أكاديمية طويق عند إبراز إيميل القبول']::text[], ARRAY['No smoking inside the unit', 'National ID required at check-in', 'Discount for Tuwaiq Academy trainees on showing the acceptance email']::text[],
   ARRAY['واي فاي مجاني', 'موقف سيارات', 'تكييف', 'مطبخ مجهّز']::text[], ARRAY['Free Wi-Fi', 'Parking', 'Air conditioning', 'Equipped kitchen']::text[],
   'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?w=1200&q=80', ARRAY['https://images.unsplash.com/photo-1595576508898-0ad5c879a061?w=1200&q=80']::text[],
   4200, 4.1, 1, 1, true, 62, 24.806, 46.758)
) as v(title_ar, title_en, city_ar, city_en, district_ar, district_en,
       description_ar, description_en, property_type_ar, property_type_en,
       policy_ar, policy_en, amenities_ar, amenities_en, image_url, image_urls,
       price, rating, rooms, bathrooms, is_available, area, lat, lng)
returning id, title_ar;

--  المتوقع: 18 صفًّا في النتيجة. إن ظهرت 0 فلا صف لهذا البريد في profiles
--  (شغّلي profiles_on_signup.sql أولًا).




-- ===========================================================================
--  إن ظهر خطأ نوع في policy_ar / amenities_ar / image_urls
-- ===========================================================================
--
--  الأعمدة هنا مكتوبة على أنها مصفوفات نصية (text[]). إن كانت في جدولك من
--  نوع jsonb فستظهر رسالة column ... is of type jsonb. تحقّقي بـ:
--
--    select column_name, data_type from information_schema.columns
--    where table_schema = 'public' and table_name = 'home'
--      and column_name in ('policy_ar','amenities_ar','image_urls');
--
--  وأخبريني بالنتيجة لأحوّل الصيغة — أو استبدلي بنفسك كل
--  ARRAY['a','b']::text[]  بـ  '["a","b"]'::jsonb
