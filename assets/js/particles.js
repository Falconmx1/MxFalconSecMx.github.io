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
