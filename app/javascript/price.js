window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  if (path === "/items/new" || path === "/items") {
    //    出品ページの場合　||　出品ページの検証にかかった場合
    const priceInput = document.getElementById('item-price');
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener('input', () => {
      const inputRegex = /^([1-9]\d*|0)$/
      const inputValue = document.getElementById("item-price").value;
      if (inputRegex.test(inputValue)) {
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
      } else {
        addTaxDom.innerHTML = '半角数字のみ入力可能'
        profitDom.innerHTML = '半角数字のみ入力可能'
      }
    })
  }
});