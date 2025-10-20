#!/bin/bash
echo "🚀 Verificando MxFalconSecMx versión 3.0..."
[ -f index.html ] && echo "✅ index.html encontrado" || echo "❌ index.html NO encontrado"
[ -f assets/css/style.css ] && echo "✅ CSS encontrado" || echo "❌ CSS NO encontrado"
[ -f assets/js/main.js ] && echo "✅ JS encontrado" || echo "❌ JS NO encontrado"
[ -f assets/img/hero.jpg ] && echo "✅ Imagen hero.jpg encontrada" || echo "❌ Imagen hero.jpg NO encontrada"
[ -f assets/img/hero-mobile.jpg ] && echo "✅ Imagen hero-mobile.jpg encontrada" || echo "❌ Imagen hero-mobile.jpg NO encontrada"
[ -f assets/img/logo.png ] && echo "✅ Imagen logo.png encontrada" || echo "❌ Imagen logo.png NO encontrada"
[ -f assets/img/favicon.ico ] && echo "✅ Favicon encontrado" || echo "❌ Favicon NO encontrado"
[ -f assets/img/og-image.jpg ] && echo "✅ OG Image encontrado" || echo "❌ OG Image NO encontrado"
git diff --quiet && echo "✅ Git limpio, todos los cambios subidos" || echo "❌ Git con cambios pendientes"
echo "🌐 Abriendo web en navegador..."
xdg-open https://falconmx1.github.io/MxFalconSecMx.github.io/
