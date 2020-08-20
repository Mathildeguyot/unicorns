const markerhover = () => {
  const markersgroup = document.querySelectorAll(".marker");
  const cardsgroup = document.querySelectorAll(".unicorn-index-card");
  markersgroup.forEach((marker) => {
    marker.addEventListener("mouseover", (event) => {
      document.querySelector(`.unicorn${marker.id}`).classList.add("special-class")
      marker.style.width = "50px";
      marker.style.height = "50px";
    });
    marker.addEventListener("mouseout", (event) => {
      document.querySelector(`.unicorn${marker.id}`).classList.remove("special-class")
      marker.style.width = "25px";
      marker.style.height = "25px";
    });
  });
};

export default markerhover;
