# -*- coding: utf-8 -*-
"""
يجهّز مجلد dist للنشر — وفيه ما يُنشر فقط.

الصفحة لا تشير إلى أي ملف محلي سوى config.js (الشعار مُضمَّن بداخلها)،
فرفع المجلد كامل يعني نشر README.md وملف SQL ونسخة المعاينة على العلن
بلا داعٍ. هذا السكربت ينسخ الملفين المطلوبين لا غير.
"""
import io, os, shutil

os.path.isdir('dist') and shutil.rmtree('dist')
os.makedirs('dist')

for f in ('index.html', 'config.js'):
    shutil.copy2(f, os.path.join('dist', f))

# منع فهرسة محركات البحث يُترك لكِ: احذفي هذا الملف عند الإطلاق الرسمي
io.open('dist/_headers', 'w', encoding='utf-8').write(
    "/*\n  X-Content-Type-Options: nosniff\n  Referrer-Policy: strict-origin-when-cross-origin\n")

cfg = io.open('dist/config.js', encoding='utf-8').read()
ok = 'YOUR-PROJECT-REF' not in cfg and 'YOUR-ANON-KEY' not in cfg
print('dist/ جاهز:', sorted(os.listdir('dist')))
print('المفاتيح مضبوطة داخل dist:', ok)
print('حجم الصفحة: %d KB' % (os.path.getsize('dist/index.html') // 1024))
