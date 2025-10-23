#!/bin/bash
echo "🚀 Verificando FINISH PLUS ANIMATED - 9 puntos + animaciones"

# CSS
if [ -f assets/css/style.css ]; then echo "✅ CSS encontrado"; else echo "❌ CSS NO encontrado"; fi

# JS placeholders
declare -a js_files=("particles.js" "chat_faq.js" "main.js" "blog.js" "risk_calc.js")
for js in "${js_files[@]}"; do
  if [ -f "assets/js/$js" ]; then echo "✅ JS $js encontrado"; else echo "❌ JS $js NO encontrado"; fi
done

# Imágenes
declare -a images=("hero.jpg" "hero-mobile.jpg" "logo.png" "favicon.ico" "og-image.jpg")
for img in "${images[@]}"; do
  if [ -f "assets/img/$img" ]; then echo "✅ Imagen $img encontrada"; else echo "❌ Imagen $img NO encontrada"; fi
done

# Secciones
declare -a sections=("portfolio" "blog" "calculator" "resources")
for sec in "${sections[@]}"; do
  if grep -q "<section id='$sec'>" index.html; then echo "✅ Sección $sec encontrada"; else echo "❌ Sección $sec NO encontrada"; fi
done

# Footer dinámico
if grep -q 'new Date().getFullYear()' index.html; then echo "✅ Footer dinámico encontrado"; else echo "❌ Footer dinámico NO encontrado"; fi

# Microinteracciones / animaciones
if grep -q 'fadeInUp' assets/css/style.css; then echo "✅ Animaciones fadeInUp encontradas"; else echo "❌ Animaciones NO encontradas"; fi
if grep -q 'portfolio-item' index.html; then echo "✅ Portfolio items animados encontrados"; else echo "❌ Portfolio items NO encontrados"; fi

# Git limpio
if git diff-index --quiet HEAD --; then echo "✅ Git limpio, todos los cambios subidos"; else echo "❌ Git con cambios pendientes"; fi

echo "🌐 Verifica tu web en navegador: https://falconmx1.github.io/MxFalconSecMx.github.io/"
echo "🎯 Verificación FINISH PLUS ANIMATED completa"
