function calcularRiesgo() {
  const val = document.getElementById("riskInput").value;
  const output = document.getElementById("riskOutput");
  if(val >= 0 && val <= 10) output.textContent = `Riesgo bajo: ${val*10}%`;
  else output.textContent = `Riesgo alto: ${val*10}%`;
}
