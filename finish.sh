#!/bin/bash
echo "🚀 Finalizando MxFalconSecMx setup..."

# 1️⃣ Crear carpeta CSS si no existe
mkdir -p assets/css

# 2️⃣ Escribir CSS completo
cat > assets/css/style.css << 'CSS'
/* === MxFalconSecMx Main Style === */

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: radial-gradient(circle at top, #050505, #000);
  color: #fff;
  font-family: 'JetBrains Mono', monospace;
  overflow-x: hidden;
}

/* Hero Section */
.hero {
  position: relative;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.hero-banner {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.2;
  filter: blur(4px);
}

.overlay {
  position: relative;
  text-align: center;
  z-index: 2;
  animation: fadeIn 2s ease-in-out;
}

.site-logo {
  width: 180px;
  filter: drop-shadow(0 0 15px #0ff);
  animation: glow 3s infinite alternate;
}

.overlay h1 {
  margin-top: 20px;
  font-size: 2.4rem;
  color: #0ff;
  text-shadow: 0 0 10px #0ff, 0 0 30px #0ff;
}

.overlay p {
  margin-top: 10px;
  color: #ccc;
  font-size: 1rem;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

/* Footer */
footer {
  text-align: center;
  padding: 20px;
  color: #888;
  font-size: 0.9rem;
}

/* Animations */
@keyframes glow {
  from { filter: drop-shadow(0 0 10px #0ff); }
  to { filter: drop-shadow(0 0 25px #00ffffaa); }
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Responsive */
@media (max-width: 768px) {
  .overlay h1 { font-size: 1.8rem; }
  .site-logo { width: 140px; }
  .overlay p { font-size: 0.9rem; padding: 0 10px; }
}
CSS

# 3️⃣ Confirmar cambios y hacer push
git add assets/css/style.css
git commit -m "Agregar CSS final con glow, animaciones y responsive"
git push origin main

echo "✅ Estilos aplicados y subidos a GitHub."
