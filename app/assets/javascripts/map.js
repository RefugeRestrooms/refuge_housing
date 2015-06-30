$(function() {
  var map = L.map('map').setView([51.505, -0.09], 13);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      maxZoom: 18,
      id: 'seancllns.mjefk2j8',
      accessToken: 'pk.eyJ1Ijoic2VhbmNsbG5zIiwiYSI6IjgxYmVlZWU5ZWVjYjg2ZTQ2MGFkNmQ2Nzg2YWMyODAyIn0.EwA3kBB4wRZ7LpuCI51_9A'
  }).addTo(map);
});
