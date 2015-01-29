<!DOCTYPE html>
<html>
<head>
	<title>Leaflet debug page</title>
 	<link rel="shortcut icon" href="assets/img/favicon.ico"  type="image/x-icon" >
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css" />
	<script src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/screen.css" />
	<link rel="stylesheet" href="assets/css/MarkerCluster.css" />
	<link rel="stylesheet" href="assets/css/MarkerCluster.Default.css" />
	<script src="assets/js/leaflet.markercluster-src.js"></script>
	<script type="text/javascript" src="assets/js/jobs.js"></script>
</head>
<body>

	<div id="map"></div>

	<script type="text/javascript">

		var geoJsonData = {
			"type": "FeatureCollection", 
			"features": [
				{ "type": "Feature", "id":"1", "properties": { "address": "2"   }, "geometry": { "type": "Point", "coordinates": [175.2209316333,-37.8210922667 ] } },
				{ "type": "Feature", "id":"2", "properties": { "address": "151" }, "geometry": { "type": "Point", "coordinates": [175.2238417833,-37.80975435   ] } },
				{ "type": "Feature", "id":"3", "properties": { "address": "21"  }, "geometry": { "type": "Point", "coordinates": [175.2169955667,-37.818193     ] } },
				{ "type": "Feature", "id":"4", "properties": { "address": "14"  }, "geometry": { "type": "Point", "coordinates": [175.2240856667,-37.8216963    ] } },
				{ "type": "Feature", "id":"5", "properties": { "address": "38B" }, "geometry": { "type": "Point", "coordinates": [175.2196982333,-37.8188702167 ] } },
				{ "type": "Feature", "id":"6", "properties": { "address": "38"  }, "geometry": { "type": "Point", "coordinates": [175.2209942   ,-37.8192782833 ] } }
			]
		};

		var tiles = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
			maxZoom: 18,
			attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
		});

		var map = L.map('map')
				.addLayer(tiles);

		var markers = L.markerClusterGroup();

		var geoJsonLayer = L.geoJson(geoJsonData, {
			onEachFeature: function (feature, layer) {
				layer.bindPopup(feature.properties.address);
			}
		});
		markers.addLayer(geoJsonLayer);

		map.addLayer(markers);
		map.fitBounds(markers.getBounds());
	</script>
</body>
</html>
