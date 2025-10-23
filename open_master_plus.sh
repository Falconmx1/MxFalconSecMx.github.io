#!/bin/bash
echo "🌐 Abriendo todas las secciones de MxFalconSecMx MASTER PLUS FINAL 7.0..."

URL_BASE="https://falconmx1.github.io/MxFalconSecMx.github.io/"

declare -a sections=("index.html" "#portfolio" "#blog" "#calculator" "#resources")

for sec in "${sections[@]}"; do
    if [[ "$sec" == "index.html" ]]; then
        xdg-open "$URL_BASE" >/dev/null 2>&1
    else
        xdg-open "${URL_BASE}${sec}" >/dev/null 2>&1
    fi
    sleep 1
done

echo "✅ Todas las secciones abiertas en tu navegador."
