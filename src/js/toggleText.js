const cards = document.querySelectorAll(".card-requisitos");

cards.forEach((card) => {
  card.onclick = () => {
    const texto = card.querySelector("p");

    if (texto.classList.contains("texto-escondido")) {
      texto.classList.remove("texto-escondido");
    } else {
      texto.classList.add("texto-escondido");
    }
  };
});
