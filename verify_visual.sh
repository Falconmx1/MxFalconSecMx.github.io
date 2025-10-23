#!/bin/bash
echo "🚀 Verificando visualmente MxFalconSecMx MASTER PLUS FINAL 7.0..."

URL_BASE="https://falconmx1.github.io/MxFalconSecMx.github.io/"

declare -a sections=("index.html" "#portfolio" "#blog" "#calculator" "#resources")

for sec in "${sections[@]}"; do
    echo "🔹 Checando sección: $sec ..."
    status=$(curl -o /dev/null -s -w "%{http_code}\n" "${URL_BASE}${sec}")
    if [ "$status" == "200" ]; then
        echo "✅ $sec cargó correctamente"
    else
        echo "❌ $sec NO cargó (HTTP $status)"
    fi
done

echo "🎯 Verificación visual completa. Ahora puedes abrir en tu navegador para revisar interacciones."
