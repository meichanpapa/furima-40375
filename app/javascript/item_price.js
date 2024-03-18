function sellPrice (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = inputValue * 0.1;
    addTaxDom.innerHTML = Math.floor(fee).toLocaleString();
    const profitDom = document.getElementById("profit");
    const profit = inputValue - fee;
    profitDom.innerHTML = Math.floor(profit).toLocaleString();
  })
};

window.addEventListener('turbo:load', sellPrice);
