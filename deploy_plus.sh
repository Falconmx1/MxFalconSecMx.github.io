#!/bin/bash
set -e
echo "🚀 deploy_plus.sh - optimizar, minificar, commit y push"

# 1) Ejecutar optimize_plus.sh
if [ -f ./optimize_plus.sh ]; then
  echo "🔧 Ejecutando optimize_plus.sh ..."
  ./optimize_plus.sh
else
  echo "⚠️ optimize_plus.sh no encontrado. Saltando minify step."
fi

# 2) Añadir todos los cambios y hacer commit
git add .
git commit -m "Deploy final FULL $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nada para commitear"

# 3) Push vía SSH
git push origin main
echo "✅ Push completado. Comprueba GitHub Pages en: https://falconmx1.github.io/MxFalconSecMx.github.io/"
