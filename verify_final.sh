#!/bin/bash
echo "🚀 Verificando MxFalconSecMx versión FINAL 4.0..."

# Verificar index.html
if [ -f index.html ]; then echo "✅ index.html encontrado"; else echo "❌ index.html NO encontrado"; fi

# Verificar CSS
if [ -f assets/css/style.css ]; then echo "✅ CSS encontrado"; else echo "❌ CSS NO encontrado"; fi

# Verificar JS
if [ -f assets/js/particles.js ]; then echo "✅ JS de partículas encontrado"; else echo "❌ JS NO encontrado"; fi

# Verificar imágenes
declare -a images=("hero.jpg" "hero-mobile.jpg" "logo.png" "favicon.ico" "og-image.jpg")
for img in "${images[@]}"; do
  if [ -f "assets/img/$img" ]; then echo "✅ Imagen $img encontrada"; else echo "❌ Imagen $img NO encontrada"; fi
done

# Verificar footer dinámico
if grep -q 'new Date().getFullYear()' index.html; then
  echo "✅ Footer dinámico encontrado"
else
  echo "❌ Footer dinámico NO encontrado"
fi

# Verificar Git limpio
if git diff-index --quiet HEAD --; then
  echo "✅ Git limpio, todos los cambios subidos"
else
  echo "❌ Git tiene cambios pendientes"
fi

echo "🌐 Abriendo web en navegador..."
xdg-open https://falconmx1.github.io/MxFalconSecMx.github.io/
echo "🎯 Verificación FINAL completa"
