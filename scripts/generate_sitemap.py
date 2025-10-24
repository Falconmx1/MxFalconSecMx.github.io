#!/usr/bin/env python3
import pathlib, datetime
base = "https://falconmx1.github.io/MxFalconSecMx.github.io"
root = pathlib.Path('.')
pages = []
for p in sorted(root.rglob("*.html")):
    s = str(p)
    if ".git" in s or s.startswith("assets/") or "/assets/" in s:
        continue
    rel = str(p.relative_to(root))
    pages.append(f"{base}/{rel}")
with open("sitemap.xml","w",encoding="utf-8") as f:
    f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
    f.write('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n')
    for url in pages:
        f.write(f"  <url><loc>{url}</loc><lastmod>{datetime.date.today()}</lastmod></url>\n")
    f.write('</urlset>\n')
print("✅ sitemap.xml generado con", len(pages), "entradas")
