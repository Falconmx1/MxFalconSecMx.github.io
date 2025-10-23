#!/bin/bash
echo "🚀 Ejecutando FINISH CONTENT - Portfolio, Blog, Calculadora y Recursos"

# 1️⃣ Carpetas necesarias
mkdir -p assets/img/portfolio blog assets/downloads

# 2️⃣ Portfolio de ejemplo
cat >> index.html << 'HTML'
<section id="portfolio">
  <h2>Casos de éxito</h2>
  <div class="portfolio-items">
    <div class="item">
      <img src="assets/img/portfolio/proyecto1.jpg" alt="Proyecto 1">
      <h3>Proyecto 1</h3>
      <p>Descripción breve del proyecto.</p>
    </div>
    <div class="item">
      <img src="assets/img/portfolio/proyecto2.jpg" alt="Proyecto 2">
      <h3>Proyecto 2</h3>
      <p>Descripción breve del proyecto.</p>
    </div>
  </div>
</section>
HTML

# 3️⃣ Blog de ejemplo
cat >> index.html << 'HTML'
<section id="blog">
  <h2>Blog / Tips de seguridad</h2>
  <div class="blog-items">
    <article>
      <h3>Tip de Seguridad 1</h3>
      <p>Explicación breve del tip de seguridad.</p>
      <a href="blog/articulo1.html" class="btn">Leer más</a>
    </article>
    <article>
      <h3>Tip de Seguridad 2</h3>
      <p>Explicación breve del tip de seguridad.</p>
      <a href="blog/articulo2.html" class="btn">Leer más</a>
    </article>
  </div>
</section>
HTML

# 4️⃣ Calculadora de riesgos
cat >> index.html << 'HTML'
<section id="calculator">
  <h2>Calculadora de Riesgos</h2>
  <input type="number" id="riskInput" placeholder="Nivel de riesgo">
  <button onclick="calcularRiesgo()" class="btn">Calcular</button>
  <p id="riskOutput"></p>
</section>
HTML

# 5️⃣ JS para calculadora
cat > assets/js/risk_calc.js << 'JS'
function calcularRiesgo() {
  const val = document.getElementById("riskInput").value;
  const output = document.getElementById("riskOutput");
  if(val >= 0 && val <= 10) output.textContent = `Riesgo bajo: ${val*10}%`;
  else output.textContent = `Riesgo alto: ${val*10}%`;
}
JS

# 6️⃣ Recursos descargables
cat >> index.html << 'HTML'
<section id="resources">
  <h2>Recursos descargables</h2>
  <a href="assets/downloads/guia.pdf" class="btn" download>Guía de seguridad</a>
  <a href="assets/downloads/checklist.pdf" class="btn" download>Checklist</a>
</section>
HTML

echo "✅ FINISH CONTENT ejecutado. Revisa index.html y agrega imágenes y PDFs reales."
