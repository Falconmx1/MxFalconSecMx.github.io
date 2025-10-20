#!/bin/bash
echo "🚀 Ejecutando finish_all.sh - Proyecto MxFalconSecMx al 100%"

# 1️⃣ Crear carpetas
mkdir -p assets/css assets/js assets/img

# 2️⃣ Crear CSS final
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
@media (max-width:768px){ .hero-text h1{font-size:2rem;} .hero-text p{font-size:1rem;} .site-logo{width:100px;} }
CSS

# 3️⃣ Crear JS mínimo para hamburger
cat > assets/js/main.js << 'JS'
const toggle = document.getElementById('nav-toggle');
const menu = document.getElementById('nav-menu');
toggle.addEventListener('click', () => {
  const expanded = toggle.getAttribute('aria-expanded') === 'true';
  toggle.setAttribute('aria-expanded', !expanded);
  menu.hidden = !menu.hidden;
});
JS

# 4️⃣ Crear verify_v3.sh
cat > verify_v3.sh << 'VERIFY'
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
VERIFY

# 5️⃣ Hacer ejecutables
chmod +x assets/js/main.js verify_v3.sh

# 6️⃣ Confirmar
echo "✅ finish_all.sh listo. Ejecuta ./verify_v3.sh después de push."
