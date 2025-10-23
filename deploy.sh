#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "🚀 Deploy FULL: optimize -> sitemap -> rss -> commit -> push"

# 0) Cargar clave SSH explícita (asegúrate que ~/.ssh/id_ed25519_github existe)
eval "$(ssh-agent -s)"
ssh-add -D || true
ssh-add ~/.ssh/id_ed25519_github || true

# 1) Run optimize script if exists
if [ -f ./optimize_plus.sh ]; then
  echo "🔧 Running optimize_plus.sh"
  ./optimize_plus.sh
else
  echo "⚠️ optimize_plus.sh no encontrado, saltando minify"
fi

# 2) generate sitemap & rss using scripts folder
if [ -f ./scripts/generate_sitemap.py ]; then
  python3 ./scripts/generate_sitemap.py
fi
if [ -f ./scripts/generate_rss.py ]; then
  python3 ./scripts/generate_rss.py
fi

# 3) git add/commit
git add .
git commit -m "Deploy: optimize + sitemap + rss $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nothing to commit"

# 4) push forcing use of specific key
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_github -o IdentitiesOnly=yes" git push origin main

# 5) open site in browser (if desktop)
xdg-open "https://falconmx1.github.io/MxFalconSecMx.github.io/" >/dev/null 2>&1 || echo "Abre la URL en tu navegador: https://falconmx1.github.io/MxFalconSecMx.github.io/"

echo "✅ Deploy completo"
