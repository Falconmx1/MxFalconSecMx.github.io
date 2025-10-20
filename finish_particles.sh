#!/bin/bash
echo "🚀 Ejecutando finish_particles.sh - Proyecto MxFalconSecMx al 100% con partículas y animaciones"

# 1️⃣ Crear carpetas necesarias por si faltan
mkdir -p assets/css assets/js assets/img

# 2️⃣ Reescribir CSS final con animaciones y glow
cat > assets/css/style.css << 'CSS'
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:'JetBrains Mono', monospace; background:#000; color:#fff; overflow-x:hidden; }

.hero { position:relative; text-align:center; overflow:hidden; }
.hero-banner { width:100%; height:auto; display:block; }
.hero-text { position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); text-align:center; animation:fadeIn 1.2s ease forwards; }
.hero-text h1 { font-size:3rem; color:#0ff; text-shadow:0 0 10px #0ff; transition:0.3s; }
.hero-text p { font-size:1.5rem; color:#fff; margin:10px 0; }
.hero-text .btn { display:inline-block; padding:10px 20px; color:#000; background:#0ff; border-radius:5px; text-decoration:none; transition:all 0.3s; }
.hero-text .btn:hover { background:#0aa; color:#fff; box-shadow:0 0 15px #0ff, 0 0 30px #0ff; }

.overlay { position:absolute; top:0; left:0; width:100%; height:100%; display:flex; justify-content:center; align-items:center; pointer-events:none; }
.site-logo { width:150px; opacity:0.9; animation:glowLogo 2s infinite alternate; }

.site-nav { position:relative; }
.nav-menu a { display:block; padding:10px; color:#fff; text-decoration:none; transition:0.3s; }
.nav-menu a:hover { color:#0ff; text-shadow:0 0 5px #0ff; }

@keyframes fadeIn {
  0% {opacity:0; transform:translate(-50%, -60%);}
  100% {opacity:1; transform:translate(-50%, -50%);}
}

@keyframes glowLogo {
  0% {opacity:0.8; filter:drop-shadow(0 0 5px #0ff);}
  100% {opacity:1; filter:drop-shadow(0 0 20px #0ff);}
}

@media (max-width:768px){
  .hero-text h1 { font-size:2rem; }
  .hero-text p { font-size:1rem; }
  .site-logo { width:100px; }
}
CSS

# 3️⃣ Crear JS de partículas para hero
cat > assets/js/particles.js << 'JS'
// === Partículas animadas en hero ===
document.addEventListener("DOMContentLoaded", function(){
  const svg = document.querySelector(".hero-particles");
  if(!svg) return;

  const w = svg.clientWidth;
  const h = svg.clientHeight;
  const dots = [];

  for(let i=0;i<50;i++){
    const circle = document.createElementNS("http://www.w3.org/2000/svg","circle");
    circle.setAttribute("r",Math.random()*2+1);
    circle.setAttribute("cx",Math.random()*w);
    circle.setAttribute("cy",Math.random()*h);
    circle.setAttribute("fill","#0ff");
    circle.setAttribute("fill-opacity",0.05);
    svg.appendChild(circle);
    dots.push({el:circle,vx:(Math.random()-0.5)/2,vy:(Math.random()-0.5)/2});
  }

  function animate(){
    dots.forEach(d=>{
      let cx=parseFloat(d.el.getAttribute("cx"));
      let cy=parseFloat(d.el.getAttribute("cy"));
      cx+=d.vx; cy+=d.vy;
      if(cx> w) cx=0; if(cx<0) cx=w;
      if(cy> h) cy=0; if(cy<0) cy=h;
      d.el.setAttribute("cx",cx);
      d.el.setAttribute("cy",cy);
    });
    requestAnimationFrame(animate);
  }
  animate();
});
JS

# 4️⃣ Actualizar index.html para usar JS y footer dinámico
sed -i '/<\/body>/i \<script src="assets/js/particles.js" defer></script>' index.html
sed -i 's#<footer>.*</footer>#<footer><p>&copy; '"$(date +%Y)"' Mario Falcon - MxFalconSecMx</p></footer>#' index.html

echo "✅ finish_particles.sh ejecutado correctamente. Web lista para abrir en navegador."
