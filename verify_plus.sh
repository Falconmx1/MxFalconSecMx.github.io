#!/bin/bash
echo "🚀 Verificando FINISH PLUS - 9 puntos de mejora"

# CSS
if [ -f assets/css/style.css ]; then echo "✅ CSS encontrado"; else echo "❌ CSS NO encontrado"; fi

# JS placeholders
declare -a js_files=("risk_calc.js" "blog.js")
for js in "${js_files[@]}"; do
  if [ -f "assets/js/$js" ]; then echo "✅ JS $js encontrado"; else echo "❌ JS $js NO encontrado"; fi
done

# Secciones HTML
declare -a sections=("portfolio" "blog" "calculator" "resources")
for sec in "${sections[@]}"; do
  if grep -q "id='$sec'" index.html; then echo "✅ Sección $sec encontrada"; else echo "❌ Sección $sec NO encontrada"; fi
done

# Carpetas
declare -a dirs=("assets/css" "assets/js" "assets/img/portfolio" "assets/downloads" "blog")
for d in "${dirs[@]}"; do
  if [ -d "$d" ]; then echo "✅ Carpeta $d existe"; else echo "❌ Carpeta $d NO existe"; fi
done

# Git limpio
if git diff-index --quiet HEAD --; then echo "✅ Git limpio, todos los cambios subidos"; else echo "❌ Git con cambios pendientes"; fi

echo "🎯 Verificación FINISH PLUS completa"
