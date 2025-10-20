#!/bin/bash
echo "🚀 Verificando MxFalconSecMx versión 2.0..."

# 1️⃣ Revisar CSS
if [ -f assets/css/style.css ]; then
  echo "✅ CSS encontrado: assets/css/style.css"
else
  echo "❌ CSS NO encontrado"
fi

# 2️⃣ Revisar imágenes del hero
IMGS=("hero.jpg" "hero-mobile.jpg" "logo.png" "favicon.ico" "og-image.jpg")
for img in "${IMGS[@]}"; do
  if [ -f assets/img/$img ]; then
    echo "✅ Imagen encontrada: $img"
  else
    echo "❌ Imagen NO encontrada: $img"
  fi
done

# 3️⃣ Revisar index.html
if [ -f index.html ]; then
  echo "✅ index.html encontrado"
else
  echo "❌ index.html NO encontrado"
fi

# 4️⃣ Revisar footer dinámico
if grep -q "new Date().getFullYear()" index.html; then
  echo "✅ Footer dinámico con año OK"
else
  echo "❌ Footer dinámico NO encontrado"
fi

# 5️⃣ Revisar estado de Git
if git diff --quiet && git diff --cached --quiet; then
  echo "✅ Git limpio, todos los cambios subidos"
else
  echo "❌ Git tiene cambios pendientes"
fi

# 6️⃣ Abrir web en navegador predeterminado
URL="https://falconmx1.github.io/MxFalconSecMx.github.io/"
echo "🌐 Abriendo tu web en el navegador: $URL"
xdg-open $URL 2>/dev/null || echo "⚠️ No se pudo abrir el navegador automáticamente. Abre $URL manualmente."

# 7️⃣ Recomendación responsive rápida
echo "📱 Verifica el responsive: ajusta la ventana o abre en móvil para confirmar hero y navegación."

echo "🎯 Verificación final completa versión 2.0"
