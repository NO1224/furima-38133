function priceCalc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const priceVal = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(priceVal * 0.1);
    profit.innerHTML = priceVal - addTaxPrice.innerHTML;
  });
};

window.addEventListener('load', priceCalc);