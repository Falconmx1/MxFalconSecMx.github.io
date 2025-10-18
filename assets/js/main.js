document.addEventListener('DOMContentLoaded', function(){
  const btn=document.getElementById('nav-toggle');
  const menu=document.getElementById('nav-menu');
  if(!btn||!menu)return;
  btn.addEventListener('click',function(){
    const expanded=btn.getAttribute('aria-expanded')==='true';
    btn.setAttribute('aria-expanded',String(!expanded));
    menu.hidden=expanded;
    if(!expanded){const first=menu.querySelector('a');if(first)first.focus();}
  });
  document.addEventListener('click',function(e){
    if(!menu.contains(e.target)&&!btn.contains(e.target)){btn.setAttribute('aria-expanded','false');menu.hidden=true;}
  });
  document.addEventListener('keydown',function(e){if(e.key==='Escape'){btn.setAttribute('aria-expanded','false');menu.hidden=true;btn.focus();}});
});
