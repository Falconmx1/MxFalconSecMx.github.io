#!/bin/bash
echo "🚀 Ejecutando finish_chat.sh - Integración Chat + FAQ + Formulario"

# 1️⃣ Crear carpetas necesarias
mkdir -p assets/css assets/js assets/img

# 2️⃣ CSS Final con chat, FAQ y formulario
cat > assets/css/style.css << 'CSS'
* { margin:0; padding:0; box-sizing:border-box; }
body { font-family:'JetBrains Mono', monospace; background:#000; color:#fff; overflow-x:hidden; }

.hero { position:relative; text-align:center; overflow:hidden; }
.hero-banner { width:100%; height:auto; display:block; }
.hero-text { position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); text-align:center; animation:fadeIn 1.2s ease forwards; }
.hero-text h1 { font-size:3rem; color:#0ff; text-shadow:0 0 10px #0ff; }
.hero-text p { font-size:1.5rem; color:#fff; margin:10px 0; }
.hero-text .btn { display:inline-block; padding:10px 20px; color:#000; background:#0ff; border-radius:5px; transition:all 0.3s; text-decoration:none; }
.hero-text .btn:hover { background:#0aa; color:#fff; box-shadow:0 0 15px #0ff; }

.overlay { position:absolute; top:0; left:0; width:100%; height:100%; display:flex; justify-content:center; align-items:center; pointer-events:none; }
.site-logo { width:150px; opacity:0.8; }

.site-nav { position:relative; }
.nav-menu a { display:block; padding:10px; color:#fff; text-decoration:none; transition:0.3s; }
.nav-menu a:hover { color:#0ff; }

#chat-widget { position:fixed; bottom:20px; right:20px; width:300px; max-width:90%; background:#111; border:2px solid #0ff; border-radius:10px; display:flex; flex-direction:column; overflow:hidden; box-shadow:0 0 15px #0ff; z-index:9999; font-size:0.9rem; }
#chat-header { background:#0ff; color:#000; padding:10px; cursor:pointer; text-align:center; font-weight:bold; }
#chat-body { display:none; flex-direction:column; padding:10px; max-height:400px; overflow-y:auto; background:#000; color:#fff; }
.chat-message { margin:5px 0; }
.chat-message.user { color:#0ff; }
.chat-message.bot { color:#0a0; }
#chat-input { display:flex; margin-top:10px; }
#chat-input input { flex:1; padding:5px; border-radius:5px; border:none; }
#chat-input button { padding:5px 10px; background:#0ff; border:none; border-radius:5px; cursor:pointer; color:#000; margin-left:5px; }

.faq-section { margin:40px auto; max-width:800px; }
.faq-item { margin-bottom:15px; border-bottom:1px solid #0ff; padding-bottom:10px; }
.faq-question { cursor:pointer; font-weight:bold; color:#0ff; }
.faq-answer { display:none; padding-top:5px; color:#fff; }

form.contact-form { margin:30px auto; max-width:600px; display:flex; flex-direction:column; }
form.contact-form input, form.contact-form textarea { margin-bottom:10px; padding:10px; border-radius:5px; border:none; }
form.contact-form button { padding:10px; background:#0ff; color:#000; border:none; border-radius:5px; cursor:pointer; transition:0.3s; }
form.contact-form button:hover { background:#0aa; color:#fff; }
CSS

# 3️⃣ JS de chat y FAQ
cat > assets/js/chat_faq.js << 'JS'
// Toggle chat
const chatHeader = document.getElementById('chat-header');
const chatBody = document.getElementById('chat-body');
chatHeader.addEventListener('click', () => {
  chatBody.style.display = chatBody.style.display === 'flex' ? 'none' : 'flex';
});

// FAQ Toggle
document.querySelectorAll('.faq-question').forEach(q => {
  q.addEventListener('click', () => {
    const ans = q.nextElementSibling;
    ans.style.display = ans.style.display === 'block' ? 'none' : 'block';
  });
});

// Simple chat simulation
const chatInput = document.getElementById('chat-user-input');
const chatSend = document.getElementById('chat-send-btn');
const chatContent = document.getElementById('chat-content');

chatSend.addEventListener('click', () => {
  const msg = chatInput.value.trim();
  if(msg==='') return;
  const userMsg = document.createElement('div');
  userMsg.classList.add('chat-message','user');
  userMsg.textContent = msg;
  chatContent.appendChild(userMsg);
  chatInput.value='';
  setTimeout(() => {
    const botMsg = document.createElement('div');
    botMsg.classList.add('chat-message','bot');
    botMsg.textContent = 'DeepSeek: Entendido, revisaremos tu consulta 🔒';
    chatContent.appendChild(botMsg);
    chatContent.scrollTop = chatContent.scrollHeight;
  }, 800);
});
JS

# 4️⃣ Insertar HTML en index.html si no existe
grep -q '<div id="chat-widget">' index.html || cat >> index.html << 'HTML'

<!-- Chat Widget -->
<div id="chat-widget">
  <div id="chat-header">💬 Chat DeepSeek</div>
  <div id="chat-body">
    <div id="chat-content"></div>
    <div id="chat-input">
      <input id="chat-user-input" type="text" placeholder="Escribe tu mensaje...">
      <button id="chat-send-btn">Enviar</button>
    </div>
  </div>
</div>

<!-- FAQ -->
<section class="faq-section">
  <h2>Preguntas Frecuentes</h2>
  <div class="faq-item">
    <div class="faq-question">¿Qué servicios de ciberseguridad ofrecen?</div>
    <div class="faq-answer">PenTesting, auditorías, consultoría y más.</div>
  </div>
  <div class="faq-item">
    <div class="faq-question">¿Cómo puedo contactarlos?</div>
    <div class="faq-answer">Rellena el formulario o envía un correo a contacto@mxfalcon.mx</div>
  </div>
</section>

<!-- Formulario Inteligente -->
<form class="contact-form">
  <input type="text" placeholder="Nombre" required>
  <input type="email" placeholder="Email" required>
  <textarea placeholder="Mensaje" required></textarea>
  <button type="submit">Enviar</button>
</form>

<script src="assets/js/chat_faq.js" defer></script>
HTML

echo "✅ finish_chat.sh ejecutado correctamente. Web lista para abrir."
