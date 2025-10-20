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
