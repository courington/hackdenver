//= require jquery
//= require create

$(function() {

	// find current location

	navigator.geolocation.getCurrentPosition(function(location) {

		var lat = location.coords.latitude, lng = location.coords.longitude;

		/*Create an object for options*/ 
		var options = {
			elt               : document.getElementById('map'),
			zoom              : 14,
			latLng            : { lat : lat, lng : lng },
			mtype             : 'map',
			bestFitMargin     : 0, /* margin offset from the map viewport when applying a bestfit on shapes*/
			zoomOnDoubleClick : true
		};

		// the map global variable :(
		var map = new MQA.TileMap(options);
    var info = new MQA.Poi({ lat:lat, lng:lng });
    info.infoTitleHTML = 'Your Location';
    info.infoContentHTML = '<a href="#">Launch Beacon!</a>';
    var icon=new MQA.Icon('http://www.mapquestapi.com/staticmap/geticon?uri=poi-blue_1.png',20,29);
    info.setIcon(icon);

    map.addShape(info);

    // Add your location pin
    //
		// grab beacons at current location
		$.getJSON('/beacons', { lat: lat, lng: lng }, function(response) {
			$.each(response, function(i, beacon) {
				 var info = new MQA.Poi({ lat:beacon.lat, lng:beacon.lng });
         console.log(beacon);
				 info.infoTitleHTML = beacon.user.first_name + ' ' + beacon.user.last_name;
				 info.infoContentHTML = beacon.description;
         info.infoContentHTML += '<br><a class="beacon" data-id="' + beacon.id + '" href="#">More Information</a>';

         // Set custom icon
         var icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-green_1.png';
         if (beacon.duration <= 1) {
           icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-pink_1.png';
         } else if (beacon.duration <= 2 ) {
           icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-yellow_1.png';
         };
         var icon=new MQA.Icon(icon_link,20,29);
         info.setIcon(icon);

				 map.addShape(info);
			});
		});

	});

});
