window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = parseInt(inputValue * 0.1)
   const tax = inputValue * 0.1
   const SalesProfit = document.getElementById("profit");
   SalesProfit.innerHTML = parseInt(inputValue - tax)
  })
});
