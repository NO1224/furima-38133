const cardPay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form)

    const card = {
      number: formData.get()
    }


  })
}

window.addEventListener("load", cardPay)