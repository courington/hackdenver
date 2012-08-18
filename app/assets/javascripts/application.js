//= require jquery
//= require create
//= require destroy

$(function() {

	// find current location

	navigator.geolocation.getCurrentPosition(function(location) {

		var lat = location.coords.latitude, lng = location.coords.longitude;

		// XXX hack append lat/lng to new beacon url
		$('#newBeacon').each(function() {
			var link = $(this);
			link.attr('href', link.attr('href') + '?lat='+lat+'&lng='+lng);
		});
		$('#beaconNav').show();

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
		map = new MQA.TileMap(options);

    // Add your location pin
    if (!currentUser.beacon) {
      var info = new MQA.Poi({ lat:lat, lng:lng });
      info.infoContentHTML = 'Your Location<br/><a href="#">Launch Beacon!</a>';
      var icon=new MQA.Icon('http://www.mapquestapi.com/staticmap/geticon?uri=poi-blue_1.png',20,29);
      info.setIcon(icon);
      map.addShape(info);
    }

 		// grab beacons at current location
		$.getJSON('/beacons', { lat: lat, lng: lng }, function(response) {
			$.each(response, function(i, beacon) {
				 var info = new MQA.Poi({ lat:beacon.lat, lng:beacon.lng });
         info.infoTitleHTML = '';
				 info.infoContentHTML = beacon.user.first_name + ' ' + beacon.user.last_name;
				 info.infoContentHTML += '<br/>';
				 info.infoContentHTML += beacon.description;
         info.infoContentHTML += '<br><a href="#' + beacon.id + '">More Information</a>';

         // Set custom icon
         var icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-green_1.png';
         if (beacon.duration <= 1) {
           icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-pink_1.png';
         } else if (beacon.duration <= 2 ) {
           icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=poi-yellow_1.png';
         };
         if (currentUser.beacon && currentUser.beacon.id == beacon.id) {
           icon_link = 'http://www.mapquestapi.com/staticmap/geticon?uri=mcenter.png';
         }
         var icon=new MQA.Icon(icon_link,20,29);
         info.setIcon(icon);
				 map.addShape(info);
			});
		});

	});

  $('#beaconView button.map').click(function() {
    $('#map').show();
    $('#beaconView').hide();
    window.location.hash = '';
    return false;
  });

  $(window).bind('hashchange', function() {
    if (window.location.hash.length > 1) {
      $('#map').hide();
      $('#beaconView').show();
      var beaconId = window.location.hash.slice(1,window.location.hash.length);
      $.getJSON('/beacons/' + beaconId, function(response) {
        $('#beaconView').each(function() {
          beacon = $(this);
          beacon.find('.name').text(response.user.first_name + ' ' + response.user.last_name);
          beacon.find('.description').text(response.beacon.description);
          beacon.find('.duration').text(response.beacon.duration + ' hours');
          if (response.twitter) {
            beacon.find('.twitter a').href();
          }
        });
      });
    };
  });

});
