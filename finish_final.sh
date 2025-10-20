#!/bin/bash
echo "🚀 Ejecutando finish_final.sh - Proyecto MxFalconSecMx al 100%"

# 1️⃣ Crear carpetas necesarias
mkdir -p assets/css assets/js assets/img

# 2️⃣ Escribir CSS final
cat > assets/css/style.css << 'CSS'
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:'JetBrains Mono', monospace; background:#000; color:#fff; overflow-x:hidden; }

.hero { position:relative; text-align:center; overflow:hidden; }
.hero-banner { width:100%; height:auto; display:block; }
.hero-text { position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); text-align:center; }
.hero-text h1 { font-size:3rem; color:#0ff; text-shadow:0 0 10px #0ff; }
.hero-text p { font-size:1.5rem; color:#fff; margin:10px 0; }
.hero-text .btn { display:inline-block; padding:10px 20px; color:#000; background:#0ff; border-radius:5px; transition:all 0.3s; text-decoration:none; }
.hero-text .btn:hover { background:#0aa; color:#fff; box-shadow:0 0 10px #0ff; }

.overlay { position:absolute; top:0; left:0; width:100%; height:100%; display:flex; justify-content:center; align-items:center; pointer-events:none; }
.site-logo { width:150px; opacity:0.8; }

.site-nav { position:relative; }
.nav-menu a { display:block; padding:10px; color:#fff; text-decoration:none; transition:0.3s; }
.nav-menu a:hover { color:#0ff; }

@media (max-width:768px){
  .hero-text h1 { font-size:2rem; }
  .hero-text p { font-size:1rem; }
  .site-logo { width:100px; }
}
CSS

# 3️⃣ Escribir JS para hamburger nav y año dinámico
cat > assets/js/main.js << 'JS'
document.addEventListener('DOMContentLoaded', () => {
  const navToggle = document.getElementById('nav-toggle');
  const navMenu = document.getElementById('nav-menu');

  navToggle.addEventListener('click', () => {
    const expanded = navToggle.getAttribute('aria-expanded') === 'true' || false;
    navToggle.setAttribute('aria-expanded', !expanded);
    navMenu.hidden = expanded;
  });

  // Footer dinámico
  const yearElem = document.getElementById('year');
  if(yearElem) yearElem.textContent = new Date().getFullYear();
});
JS

# 4️⃣ Reemplazar footer en index.html
sed -i '/<footer>/,/<\/footer>/c\<footer>\n  <p>&copy; <span id="year"></span> Mario Falcon - MxFalconSecMx</p>\n</footer>' index.html

# 5️⃣ Mensaje final
echo "✅ finish_final.sh ejecutado correctamente. Ahora solo revisa tu web en navegador."
