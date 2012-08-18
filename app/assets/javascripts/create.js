// Create Beacon
$(function() {

	var startBeacon = function startBeacon(){

		navigator.geolocation.getCurrentPosition(function(location) {

			var lat = location.coords.latitude, lng = location.coords.longitude;

			$.ajax({
			    url: "/beacons",
			    type: "POST",
			    data: { lat: lat, lng: lng,  description: "foobar", duration: 2},
			    success: function(resp){ 
			    	console.log(resp);
			    },
			    error: function(resp){
			    	console.log(resp);
			    }
			});

		});
	}

	$("#create").bind("click", function(e){
		e.preventDefault();
		startBeacon();
	})
})