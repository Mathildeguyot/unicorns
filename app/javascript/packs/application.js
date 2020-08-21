// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr"
import { initMapbox } from '../plugins/init_mapbox';

import { fetchCurrentLocation } from '../components/fetch_current_location';
import { bookUnicorn } from '../components/fetch_current_location';

import { initFixBookingCardOnScroll } from '../components/booking-card';
import markerhover from '../components/hovering_markers.js'
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from '../plugins/flatpickr';

// Fixing booking card when scrolling
// initFixBookingCardOnScroll();

// TBD
// bookUnicorn();

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';



document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFlatpickr();
  if (document.querySelector(".home")) {
    fetchCurrentLocation();
     initAutocomplete();
  };

  // Call your functions here, e.g:
  // initSelect2();
  // if (document.querySelector("#map")) {
  //   markerhover();
  //   const markersgroup = document.querySelectorAll(".marker");
  //   const cardsgroup = document.querySelectorAll(".unicorn-index-card");
  //   cardsgroup.forEach((card) => {
  //     card.addEventListener("mouseover", (event) => {
  //       card.classList.add("special-class")
  //       document.querySelector(`.marker .${card.id}`).width = "50px";
  //       document.querySelector(`.marker .${card.id}`).height = "50px";
  //     });
  //     card.addEventListener("mouseout", (event) => {
  //       card.classList.remove("special-class")
  //       document.querySelector(`.marker .${card.id}`).width = "25px";
  //       document.querySelector(`.marker .${card.id}`).height = "25px";
  //     });
  //   });
  // };
});


 // je sélectionne tous les markers (all)
 //je sélectionne toutes mes cards qui ont leur dataset id
 //j'ajoute un event listener sur touts les markers mouseenter
 //j'aljoute une classe à la card en question


