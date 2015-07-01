$(function() {
  var latitude = $('#map').data('latitude');
  var longitude = $('#map').data('longitude');

  var map = L.map('map').setView([latitude, longitude], 13);
  var RADIUS = 1000;

  L.circle(L.latLng(latitude, longitude), RADIUS, {
      opacity: 1,
      weight: 1,
      fillOpacity: 0.4
  }).addTo(map);

  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      maxZoom: 18,
      id: 'seancllns.mjefk2j8',
      accessToken: 'pk.eyJ1Ijoic2VhbmNsbG5zIiwiYSI6IjgxYmVlZWU5ZWVjYjg2ZTQ2MGFkNmQ2Nzg2YWMyODAyIn0.EwA3kBB4wRZ7LpuCI51_9A'
  }).addTo(map);
});
