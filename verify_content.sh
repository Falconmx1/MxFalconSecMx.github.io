#!/bin/bash
echo "🚀 Verificando FINISH CONTENT - Portfolio, Blog, Calculadora y Recursos"

# Verificar secciones en index.html
sections=("portfolio" "blog" "calculator" "resources")
for sec in "${sections[@]}"; do
  if grep -q "id=\"$sec\"" index.html; then
    echo "✅ Sección $sec encontrada"
  else
    echo "❌ Sección $sec NO encontrada"
  fi
done

# Verificar JS calculadora
if [ -f assets/js/risk_calc.js ]; then
  echo "✅ JS risk_calc.js encontrado"
else
  echo "❌ JS risk_calc.js NO encontrado"
fi

# Verificar carpeta assets/img/portfolio
if [ -d assets/img/portfolio ]; then
  echo "✅ Carpeta assets/img/portfolio existe"
else
  echo "❌ Carpeta assets/img/portfolio NO existe"
fi

# Verificar carpeta blog
if [ -d blog ]; then
  echo "✅ Carpeta blog existe"
else
  echo "❌ Carpeta blog NO existe"
fi

# Verificar carpeta assets/downloads
if [ -d assets/downloads ]; then
  echo "✅ Carpeta assets/downloads existe"
else
  echo "❌ Carpeta assets/downloads NO existe"
fi

# Verificar Git limpio
if git diff-index --quiet HEAD --; then
  echo "✅ Git limpio, todos los cambios subidos"
else
  echo "❌ Git con cambios pendientes"
fi

echo "🎯 Verificación FINISH CONTENT completa. Abre tu web en navegador para revisar visualmente."
