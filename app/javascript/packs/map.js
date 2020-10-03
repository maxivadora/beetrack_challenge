let map;

initMap = () => {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 26.8083, lng: 65.2176 },
    zoom: 8,
  });
}