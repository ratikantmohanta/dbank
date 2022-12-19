import { execArgv } from "process";
import { dBank_backend } from "../../declarations/dBank_backend";

window.addEventListener("load", async () => {

  const currentAmount = await dBank_backend.checkBalance();

  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});


document.querySelector('form').addEventListener("submit", async (event) => {
  event.preventDefault();
  // console.log("Submitted");

  const button = event.target.querySelector('#submit-btn');

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);


  if (document.getElementById("input-amount").value.length != 0) {
    await dBank_backend.topUp(inputAmount);
  }

  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await dBank_backend.withdraw(outputAmount);
  }

  await dBank_backend.compund();

  const currentAmount = await dBank_backend.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  button.removeAttribute("disabled");
});