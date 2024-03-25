function sellPrice (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(fee).toLocaleString();
    const profitDom = document.getElementById("profit");
    const profit = inputValue - fee;
    profitDom.innerHTML = profit.toLocaleString();
  })
};

window.addEventListener('turbo:load', sellPrice);
window.addEventListener('turbo:render', sellPrice);