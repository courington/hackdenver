//= require jquery

$(function() {

	// find current location

	navigator.geolocation.getCurrentPosition(function(location) {

		var lat = location.coords.latitude, lng = location.coords.longitude;

		/*Create an object for options*/ 
		var options = {
			elt               : document.getElementById('map'),
			zoom              : 10,
			latLng            : { lat : lat, lng : lng },
			mtype             : 'map',
			bestFitMargin     : 0, /* margin offset from the map viewport when applying a bestfit on shapes*/
			zoomOnDoubleClick : true
		};

		// the map global variable :(
		var map = new MQA.TileMap(options);

		// grab beacons at current location
		$.getJSON('/beacons', { lat: lat, lng: lng }, function(response) {
			$.each(response, function(i, beacon) {
				 var info = new MQA.Poi({ lat:beacon.lat, lng:beacon.lng });
				 info.infoContentHTML = beacon.user.name;
				 map.addShape(info);
			});
		});

	});

});
