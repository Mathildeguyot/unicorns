const cardhover = () => {
  const markersgroup = document.querySelectorAll(".marker");
  const cardsgroup = document.querySelectorAll(".unicorn-index-card");
  cardsgroup.forEach((card) => {
    card.addEventListener("mouseover", (event) => {
      card.classList.add("special-class")
      const marker = document.querySelector(`.marker${card.id}`);
      marker.style.width = "50px";
      marker.style.height = "50px";
    });
    card.addEventListener("mouseout", (event) => {
      card.classList.remove("special-class")
      const marker = document.querySelector(`.marker${card.id}`);
      marker.style.width = "25px";
      marker.style.height = "25px";
    });
  });
}

export default cardhover;

