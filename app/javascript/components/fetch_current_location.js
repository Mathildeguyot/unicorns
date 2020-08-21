const mapboxKey = "pk.eyJ1IjoiemVrdW1pIiwiYSI6ImNrZTFlcTk4azQ1MmcyenBhdGszb2ZiYzMifQ.16F2V3sKe52p6e-mXa4JKw"

const fetchCurrentLocation = (event) => {
  const currentLocationLink = document.getElementById('current-location');
  currentLocationLink.addEventListener("click", (event) => {
    event.preventDefault();
    navigator.geolocation.getCurrentPosition((data) => {
      const longitude = data.coords.longitude
      const latitude = data.coords.latitude
      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${longitude},${latitude}.json?types=address&access_token=${mapboxKey}`)
        .then(response => response.json())
        .then((data) => {
          const address = data.features[0].place_name
          const location = document.querySelector("#location")
          console.log(location)
          location.value = address
        });
      });
});
};


export { fetchCurrentLocation };
