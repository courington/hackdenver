// Create Beacon
$(function() {

	var createBeaconPoi = function createBeaconPoi(resp){
		var me= new MQA.Poi({lat:resp.lat, lng:resp.lng }) ;
		var icon=new MQA.Icon("http://developer.mapquest.com/content/documentation/common/images/smiley.png",32,52);
		me.setIcon(icon);
		me.setShadowOffset({x:10,y:-25});

		map.addShape(me)
	};

	var startBeacon = function startBeacon(){

		navigator.geolocation.getCurrentPosition(function(location) {

			var lat = location.coords.latitude, lng = location.coords.longitude;

			$.ajax({
			    url: "/beacons",
			    type: "POST",
			    data: { lat: lat, lng: lng,  description: "foobar", duration: 2},
			    success: function(resp){ 
			    	console.log(resp);
			    	createBeaconPoi(resp);
			    },
			    error: function(resp){
			    	console.log(resp);
			    }
			});

		});
	};

	$("#create").bind("click", function(e){
		e.preventDefault();
		startBeacon();
	});
})
