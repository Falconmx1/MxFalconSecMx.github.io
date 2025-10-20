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
