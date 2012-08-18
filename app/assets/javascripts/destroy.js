// Destroy Beacon
$(function() {

	var destoryBeaconPoi = function createBeaconPoi(resp){

	};

	var destroy = function startBeacon(){

		$.ajax({
		    url: ("/beacons/"+1),
		    type: 'DELETE',
    		dataType: 'json',
		    success: function(resp){ 
		    	console.log(resp);
		    	//destoryBeaconPoi(resp);
		    },
		    error: function(resp){
		    	console.log(resp);
		    }
		});

	}

	$("#destroy").bind("click", function(e){
		e.preventDefault();
		destroy();
	});
})