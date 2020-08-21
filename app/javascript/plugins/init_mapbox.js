import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
const mapboxKey = "pk.eyJ1IjoiemVrdW1pIiwiYSI6ImNrZTFlcTk4azQ1MmcyenBhdGszb2ZiYzMifQ.16F2V3sKe52p6e-mXa4JKw"

const buildMap = () => {
  mapboxgl.accessToken = mapboxKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/zekumi/cke2sfgrf17yt19nwrgezy168',
    zoom: 12,
    center: [2.37,48.85]
  });
};



const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = `marker marker${marker.id}`;
    element.id = `${marker.id}`;
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '35px';
    element.style.height = '35px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxKey,
                                      mapboxgl: mapboxgl }));
  }
};


export { initMapbox };
