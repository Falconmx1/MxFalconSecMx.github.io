#!/usr/bin/env python3
import pathlib, datetime, html
base = "https://falconmx1.github.io/MxFalconSecMx.github.io"
blog_dir = pathlib.Path("blog")
items = []
if not blog_dir.exists():
    blog_dir.mkdir(parents=True, exist_ok=True)
for f in sorted(blog_dir.glob("*.*")):
    if f.suffix.lower() not in (".md",".html",".htm"): continue
    title = f.stem.replace('-', ' ').replace('_',' ').title()
    url = f"{base}/blog/{f.name}"
    mtime = datetime.datetime.fromtimestamp(f.stat().st_mtime).isoformat()
    summary = ""
    try:
        txt = f.read_text(encoding="utf-8")
        for line in txt.splitlines():
            if line.strip():
                summary = line.strip()[:200]
                break
    except Exception:
        summary = ""
    items.append({'title':title,'url':url,'date':mtime,'summary':html.escape(summary)})
rss = ['<?xml version="1.0" encoding="UTF-8"?>','<rss version="2.0"><channel>']
rss += [f"<title>MxFalconSecMx - Blog</title>", f"<link>{base}/blog/</link>", "<description>Tips y artículos de ciberseguridad</description>"]
for it in items:
    rss += [
        "<item>",
        f"<title>{it['title']}</title>",
        f"<link>{it['url']}</link>",
        f"<pubDate>{it['date']}</pubDate>",
        f"<description>{it['summary']}</description>",
        "</item>"
    ]
rss += ["</channel></rss>"]
pathlib.Path("rss.xml").write_text("\n".join(rss), encoding="utf-8")
print("✅ rss.xml generado con", len(items), "items")
