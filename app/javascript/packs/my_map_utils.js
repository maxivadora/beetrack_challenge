renderMap = (vehicleWithPositionArray) => {
  const center = { lat: -26.82414, lng: -65.2226 };
  const map = initMap(center);

  vehicleWithPositionArray.forEach((elem) => {
    let marker = createMarker(elem.positions[0], elem.name)
    marker.setMap(map)
    addInfowindowToMarker(marker, elem.name)
  });
}

initMap = (center) => {
  return new google.maps.Map(document.getElementById("map"), {
    center: center,
    zoom: 8,
  });
}

createMarker = (latLng, title) => {
  return new google.maps.Marker({
    position: latLng,
    title: title
  });
}

addInfowindowToMarker = (marker, contentString) => {
  const infowindow = new google.maps.InfoWindow({
    content: contentString,
  });

  marker.addListener("click", () => {
    infowindow.open(map, marker);
  });
}
