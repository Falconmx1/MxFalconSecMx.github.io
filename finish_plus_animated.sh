#!/bin/bash
echo "🚀 Ejecutando FINISH PLUS ANIMATED - Añadiendo microinteracciones y animaciones"

# 1️⃣ CSS animaciones extra
cat >> assets/css/style.css << 'CSS'

/* === Animaciones y microinteracciones === */
@keyframes fadeInUp {
  0% { opacity:0; transform: translateY(20px); }
  100% { opacity:1; transform: translateY(0); }
}

section { animation: fadeInUp 1s ease forwards; margin-bottom:50px; }

.btn:hover { transform: scale(1.05); }

.portfolio-item, .blog-article, .calculator-widget, .resource-card {
  transition: transform 0.3s, box-shadow 0.3s;
}

.portfolio-item:hover, .blog-article:hover, .calculator-widget:hover, .resource-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 15px #0ff;
}

CSS

# 2️⃣ HTML placeholders animados
sed -i "/<section id='portfolio'>/a <div class='portfolio-item'>Proyecto 1</div><div class='portfolio-item'>Proyecto 2</div>" index.html
sed -i "/<section id='blog'>/a <div class='blog-article'>Tip de seguridad 1</div><div class='blog-article'>Tip de seguridad 2</div>" index.html
sed -i "/<section id='calculator'>/a <div class='calculator-widget'>Calculadora placeholder</div>" index.html
sed -i "/<section id='resources'>/a <div class='resource-card'>Guía de seguridad PDF</div>" index.html

echo "✅ FINISH PLUS ANIMATED listo. Revisa tu web y agrega contenido real en cada sección."
