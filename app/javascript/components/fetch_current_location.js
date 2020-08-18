const mapboxKey = "pk.eyJ1IjoiemVrdW1pIiwiYSI6ImNrZGlsM2ZsMzA2MzEycWxjZGw5ZW5qem0ifQ.BaVucQUpM0rHWnTmtVAmOQ"

const fetchCurrentLocation = (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    const longitude = data.coords.longitude
    const latitude = data.coords.latitude
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${longitude},${latitude}.json?types=address&access_token=${mapboxKey}`)
      .then(response => response.json())
      .then((data) => {
        const address = data.features[0].place_name
        console.log(address)
        const location = document.querySelector("#location")
        console.log(location)
        location.value = address
      });
    });
}

export { fetchCurrentLocation };
