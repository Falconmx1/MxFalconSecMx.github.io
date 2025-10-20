#!/bin/bash
echo "🚀 Verificando MxFalconSecMx versión FINAL 5.0..."

# Verificar index.html
if [ -f index.html ]; then echo "✅ index.html encontrado"; else echo "❌ index.html NO encontrado"; fi

# Verificar CSS
if [ -f assets/css/style.css ]; then echo "✅ CSS encontrado"; else echo "❌ CSS NO encontrado"; fi

# Verificar JS
if [ -f assets/js/chat_faq.js ]; then echo "✅ JS chat/FAQ encontrado"; else echo "❌ JS NO encontrado"; fi

# Verificar imágenes esenciales
declare -a images=("hero.jpg" "hero-mobile.jpg" "logo.png" "favicon.ico" "og-image.jpg")
for img in "${images[@]}"; do
  if [ -f "assets/img/$img" ]; then echo "✅ Imagen $img encontrada"; else echo "❌ Imagen $img NO encontrada"; fi
done

# Verificar chat
if grep -q 'id="chat-widget"' index.html; then echo "✅ Chat widget encontrado"; else echo "❌ Chat widget NO encontrado"; fi

# Verificar FAQ
if grep -q 'faq-section' index.html; then echo "✅ FAQ encontrado"; else echo "❌ FAQ NO encontrado"; fi

# Verificar formulario
if grep -q 'contact-form' index.html; then echo "✅ Formulario encontrado"; else echo "❌ Formulario NO encontrado"; fi

# Footer dinámico
if grep -q 'new Date().getFullYear()' index.html; then echo "✅ Footer dinámico encontrado"; else echo "❌ Footer dinámico NO encontrado"; fi

# Git limpio
if git diff-index --quiet HEAD --; then echo "✅ Git limpio, todos los cambios subidos"; else echo "❌ Git con cambios pendientes"; fi

echo "🌐 Verifica tu web en navegador: https://falconmx1.github.io/MxFalconSecMx.github.io/"
echo "🎯 Verificación FINAL completa 5.0"
