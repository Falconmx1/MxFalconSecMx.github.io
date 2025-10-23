#!/bin/bash
set -e
echo "🚀 deploy_plus.sh - optimizar, minificar, commit y push"

# 1) Ejecutar optimización (si tienes optimize_plus.sh)
if [ -f ./optimize_plus.sh ]; then
  echo "🔧 Ejecutando optimize_plus.sh ..."
  ./optimize_plus.sh
else
  echo "⚠️ optimize_plus.sh no encontrado. Saltando minify step."
fi

# 2) Asegurar archivos de build (minified) en uso si prefieres cambiar referencias
# (Opcional: puedes implementar reemplazos aquí)

# 3) Añadir y commitear
git add .
git commit -m "Deploy: optimize + content update $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nothing to commit"

# 4) Push a main
git push origin main
echo "✅ Push completado. Comprueba GitHub Pages en Settings -> Pages"
