// Destroy Beacon
$(function() {

	var destoryBeaconPoi = function createBeaconPoi(resp){
		var me= new MQA.Poi({lat:resp.lat, lng:resp.lng }) ;
		var icon=new MQA.Icon("http://developer.mapquest.com/content/documentation/common/images/smiley.png",32,52);
		me.setIcon(icon);
		me.setShadowOffset({x:10,y:-25});

		map.addShape(me)
	};

	var destroy = function startBeacon(){

		$.ajax({
		    url: ("/beacons/"+1),
		    type: 'DELETE',
    		dataType: 'json',
		    success: function(resp){ 
		    	console.log(resp);
		    	//createBeaconPoi(resp);
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