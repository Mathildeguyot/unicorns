const cardhover = () => {
  const markersgroup = document.querySelectorAll(".marker");
  const cardsgroup = document.querySelectorAll(".unicorn-index-card");
  cardsgroup.forEach((card) => {
    card.addEventListener("mouseover", (event) => {
      card.classList.add("special-class")
      document.querySelector(`.marker .${card.id}`).width = "50px";
      document.querySelector(`.marker .${card.id}`).height = "50px";
    });
    card.addEventListener("mouseout", (event) => {
      card.classList.remove("special-class")
      document.querySelector(`.marker .${card.id}`).width = "25px";
      document.querySelector(`.marker .${card.id}`).height = "25px";
    });
  });
}

export default cardhover;

