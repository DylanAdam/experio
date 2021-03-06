import mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/alecou/cjseud9mo0qfp1fqydsglpc97'
  });
};

const addMarkersToMap = (map, markers) => {
  if (Array.isArray(markers)) {
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  })
    }
  else {
    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .addTo(map);
   };
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  if (Array.isArray(markers)) {
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
}
  else {
  bounds.extend([ markers.lng, markers.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  }
}

// markers.forEach((marker) => {

//   // Create a HTML element for your custom marker
//   const element = document.createElement('div');
//   element.className = 'marker';
//   element.style.backgroundImage = `url('logo-blue.png')`;
//   element.style.backgroundSize = 'contain';
//   element.style.width = '25px';
//   element.style.height = '25px';

//   // Pass the element as an argument to the new marker
//   new mapboxgl.Marker(element)
//     .setLngLat([marker.lng, marker.lat])
//     .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
//     .setHTML(marker.infoWindow.content))
//     .addTo(map);
// });

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers)
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

// [...]
// if (mapElement) {
//   // [...]
//   map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
// }

export { initMapbox };
