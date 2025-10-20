const toggle = document.getElementById('nav-toggle');
const menu = document.getElementById('nav-menu');
toggle.addEventListener('click', () => {
  const expanded = toggle.getAttribute('aria-expanded') === 'true';
  toggle.setAttribute('aria-expanded', !expanded);
  menu.hidden = !menu.hidden;
});
