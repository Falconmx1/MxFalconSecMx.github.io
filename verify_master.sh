#!/bin/bash
echo "🚀 Verificando MxFalconSecMx MASTER FINAL 6.0..."

# Verificar index.html
if [ -f index.html ]; then echo "✅ index.html encontrado"; else echo "❌ index.html NO encontrado"; fi

# Verificar CSS
if [ -f assets/css/style.css ]; then echo "✅ CSS encontrado"; else echo "❌ CSS NO encontrado"; fi

# Verificar JS
declare -a js_files=("particles.js" "chat_faq.js" "main.js")
for js in "${js_files[@]}"; do
  if [ -f "assets/js/$js" ]; then echo "✅ JS $js encontrado"; else echo "❌ JS $js NO encontrado"; fi
done

# Verificar imágenes
declare -a images=("hero.jpg" "hero-mobile.jpg" "logo.png" "favicon.ico" "og-image.jpg")
for img in "${images[@]}"; do
  if [ -f "assets/img/$img" ]; then echo "✅ Imagen $img encontrada"; else echo "❌ Imagen $img NO encontrada"; fi
done

# Verificar Chat, FAQ y Formulario
if grep -q 'widget-chat' index.html; then echo "✅ Chat widget encontrado"; else echo "❌ Chat widget NO encontrado"; fi
if grep -q 'faq-section' index.html; then echo "✅ FAQ encontrado"; else echo "❌ FAQ NO encontrado"; fi
if grep -q 'form-inteligente' index.html; then echo "✅ Formulario encontrado"; else echo "❌ Formulario NO encontrado"; fi

# Footer dinámico
if grep -q 'new Date().getFullYear()' index.html; then echo "✅ Footer dinámico encontrado"; else echo "❌ Footer dinámico NO encontrado"; fi

# Verificar Git limpio
if git diff-index --quiet HEAD --; then echo "✅ Git limpio, todos los cambios subidos"; else echo "❌ Git con cambios pendientes"; fi

echo "🌐 Verifica tu web en navegador: https://falconmx1.github.io/MxFalconSecMx.github.io/"
echo "🎯 Verificación MASTER FINAL completa"
