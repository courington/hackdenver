// Create Beacon
$(function() {
	$("#create").bind("click", function(){
		console.log("create")
	})

	// grab beacons at current location
	$.post("beacons/create", function(data) {
	   alert("Data Loaded: " + data);
	 });
})