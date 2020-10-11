renderMap = (vehicleWithPositionArray) => {
  const center = { lat: -26.82414, lng: -65.2226 };
  const map = initMap(center);
  let bounds = new google.maps.LatLngBounds()

  vehicleWithPositionArray.forEach((elem) => {
    
    if (elem.positions[0] == undefined ) { return }

    // create marker
    const positionMarker = createLatLng(elem.positions[0])

    let marker = createMarker(positionMarker, elem.name)
    marker.setMap(map)

    bounds.extend(positionMarker)

    const content = `${elem.name} - ${elem.positions[0].sent_at}`
    addInfowindowToMarker(marker, content)

    // create polyline

    const polylinePath = buildPolylinePath(elem.positions)
    let polyline = createPolyline(polylinePath)
    polyline.setMap(map)
  });
  map.fitBounds(bounds)
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

createPolyline = (path) => {
  return new google.maps.Polyline({
    path: path,
    geodesic: true,
    strokeColor: getRandomColor(),
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });
}

createLatLng = (position) => {
  return {
    lat: parseFloat(position.latitude),
    lng: parseFloat(position.longitude)
  }
}

addInfowindowToMarker = (marker, contentString) => {
  const infowindow = new google.maps.InfoWindow({
    content: contentString,
  });

  marker.addListener("click", () => {
    infowindow.open(map, marker);
  });
}

buildPolylinePath = (positions) => {
  return positions.map((position) => {
    return createLatLng(position)
  })
}

getRandomColor = () => {
  colors = [
    '#FF1744', '#00B0FF',
    '#FFEA00', '#D500F9',
    '#1DE9B6', '#FF9100',
    '#3D5AFE', '#FF3D00',
    '#FFFFFF', '#607D8B',
  ]
  randomIndex = Math.floor(colors.length * Math.random());
  return colors[randomIndex]
}
