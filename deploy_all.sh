#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "🚀 deploy_all.sh iniciado"

# 0) SSH key (asegúrate existe ~/.ssh/id_ed25519_github)
if [ ! -f ~/.ssh/id_ed25519_github ]; then
  echo "⚠️ No se encontró ~/.ssh/id_ed25519_github. Asegura tu clave y vuelve a correr el script."
  exit 1
fi

# start agent and add key
eval "$(ssh-agent -s)" >/dev/null
ssh-add -D || true
ssh-add ~/.ssh/id_ed25519_github || true

# 1) Run optimize if exists
if [ -f ./optimize_plus.sh ]; then
  echo "🔧 Ejecutando optimize_plus.sh..."
  bash ./optimize_plus.sh
else
  echo "⚠️ optimize_plus.sh no encontrado, saltando optimización."
fi

# 2) Generate sitemap & rss
if [ -f ./scripts/generate_sitemap.py ]; then
  echo "🔍 Generando sitemap..."
  python3 ./scripts/generate_sitemap.py
fi
if [ -f ./scripts/generate_rss.py ]; then
  echo "🔍 Generando RSS..."
  python3 ./scripts/generate_rss.py
fi

# 3) Optional: inject Google Analytics ID into index.html if ENV GA_ID present
#    Provide GA by: export GA_ID="G-XXXXXXXXXX" before running script, or pass as first arg.
GA_ID="${GA_ID:-$1}"
if [ -n "$GA_ID" ]; then
  echo "📈 Inyectando Google Analytics ID: $GA_ID"
  # create a snippet file
  GA_SNIPPET="<script async src=\"https://www.googletagmanager.com/gtag/js?id=${GA_ID}\"></script>
<script>
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', '${GA_ID}', { 'anonymize_ip': true });
</script>"
  # guardamos backup
  if grep -q "gtag('config'" index.html 2>/dev/null; then
    echo "⏭️ index.html ya tiene gtag, no se inyecta para evitar duplicados."
  else
    # insertar antes de </head>
    tmpfile=$(mktemp)
    sed "/<\/head>/i ${GA_SNIPPET//$'\n'/\\n}" index.html > "$tmpfile" && mv "$tmpfile" index.html
    echo "✅ GA snippet inyectado en index.html"
  fi
fi

# 4) Ensure robots, sitemap and rss are tracked
git add robots.txt sitemap.xml rss.xml 2>/dev/null || true

# 5) Add all changes, commit, push using SSH key
git add -A
git commit -m "Deploy: optimize + sitemap + rss $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nada nuevo para commitear"
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_github -o IdentitiesOnly=yes" git push origin main

# 6) Open site (if desktop)
echo "🔗 Abrir: https://falconmx1.github.io/MxFalconSecMx.github.io/"
xdg-open "https://falconmx1.github.io/MxFalconSecMx.github.io/" >/dev/null 2>&1 || true

echo "✅ Deploy completo"
