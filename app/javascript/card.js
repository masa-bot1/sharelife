const pay = () => {
  Payjp.setPublicKey("pk_test_004b93273275c5db78aff1c4");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_order[number]"),
      cvc: formData.get("user_order[cvc]"),
      exp_month: formData.get("user_order[exp_month]"),
      exp_year: `20${formData.get("user_order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order-number").removeAttribute("name");
      document.getElementById("order-cvc").removeAttribute("name");
      document.getElementById("order-exp-month").removeAttribute("name");
      document.getElementById("order-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);