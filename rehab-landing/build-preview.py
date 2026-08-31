# -*- coding: utf-8 -*-
"""
يبني نسخة المعاينة من index.html.

index.html هو الملف الحقيقي الذي تنشرينه: مستند HTML كامل بـ doctype
واتجاه rtl مضبوط في الوسم نفسه.
preview.artifact.html نسخة منه بلا غلاف <html>/<head>/<body>، لأن منصة
الـ Artifacts تضيف هذا الغلاف بنفسها. لا تحرّري ملف المعاينة يدويًا —
عدّلي index.html ثم شغّلي:  python build-preview.py
"""
import io, re

src = io.open('index.html', encoding='utf-8').read()

head = re.search(r'<head>(.*?)</head>', src, re.DOTALL).group(1)
body = re.search(r'<body>(.*?)</body>', src, re.DOTALL).group(1)

# نحذف من الترويسة ما تتكفّل به المنصة أو ما لا معنى له خارج <head>
head = re.sub(r'<meta charset[^>]*>\s*', '', head)
head = re.sub(r'<meta name="viewport"[^>]*>\s*', '', head)

out = (head.strip() + '\n' + body.strip() + '\n')
io.open('preview.artifact.html', 'w', encoding='utf-8').write(out)

print('preview.artifact.html written: %d KB' % (len(out.encode('utf-8')) // 1024))
for bad in ('<!doctype', '<html', '<head', '<body'):
    assert bad not in out.lower(), 'wrapper leaked: ' + bad
print('no wrapper tags leaked')
