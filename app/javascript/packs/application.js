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

import { fetchCurrentLocation } from '../components/fetch_current_location';
import { bookUnicorn } from '../components/fetch_current_location';

import { initFixBookingCardOnScroll } from '../components/booking-card';

// Fixing booking card when scrolling
// initFixBookingCardOnScroll();

// TBD
// bookUnicorn();

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
const currentLocationLink = document.getElementById('current-location');


document.addEventListener('turbolinks:load', () => {
  currentLocationLink.addEventListener('click', fetchCurrentLocation)
  // Call your functions here, e.g:
  // initSelect2();
});

