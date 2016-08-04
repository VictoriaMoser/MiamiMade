//********* geolocation

// if (navigator.geolocation) {
//
// 	function error(err) {
// 		console.warn('ERROR(' + err.code + '): ' + err.message);
// 	}
//
// 	function success(pos){
// 		userCords = pos.coords;
// 		return userCords;
// 	}
//
// 	// Get the user's current position
// 	navigator.geolocation.getCurrentPosition(success, error);
// 	//console.log(pos.latitude + " " + pos.longitude);
// } else {
// 	alert('Geolocation is not supported in your browser');
// }

//********** End Geo location


/*change map to map-canvas*/

$(function() {

	var investorType = $('.investor-type').val();

	$('button').on('click', function(){
		$.ajax({
			url: '/search',
			data: {
				investorType: investorType,

			}
		})
	});
});

var map;

var markers = [];

function initMap(){
	map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: {lat: 26.79, lng: -80.59},
		zoom: 7,
		scrollwheel: false
	});

	var investors = $('#map-data').data().investors;
	var startups = $('#map-data').data().startups;
	var locations = [];

	console.log(investors)
	console.log(startups)

	for (var i = 0; i < investors.length; i++) {
		var location = {
										title: investors[i].name,
										location: {lat: investors[i].latitude, lng: investors[i].longitude },
										short_description: investors[i].shortdescription,
										address: investors[i].address,
										website: investors[i].website,
										founded: investors[i].founded_date,
										full_description: investors[i].description,
										vertical: investors[i].vertical,
										type:"investor"
									}

		locations.push(location);
	}

	// console.log("Investors information: " + locations);

	for (var i = 0; i < startups.length; i++) {
		var location = {
										title: startups[i].name,
										location: {lat: startups[i].latitude, lng: startups[i].longitude },
										short_description: startups[i].shortdescription,
										address: startups[i].address,
										website: startups[i].website,
										founded: startups[i].founded_date,
										full_description: startups[i].description,
										vertical: startups[i].vertical,
										type:"startup"
									}

		locations.push(location);
	}

	// console.log("StartUps added: "+locations);


	console.log(locations);

	var largeInfowindow = new google.maps.InfoWindow();


	var bounds = new google.maps.LatLngBounds();

	//The following group uses the location array to create an array of markers to show them in the map

	for (var i = 0; i < locations.length; i++) {
		// Get the position from the location array
		var position = locations[i].location;
		var title = locations[i].title;
		// var description = locations[i].description;
		var type = locations[i].type;
		var founded = locations[i].founded;
		var address = locations[i].address;
		var description = locations[i].short_description;
		var vertical = locations[i].type;
		var website = locations[i].website;
		// depedning on the type of entity change the icon to be presented in the map
		var type_entity;
		if (type == 'investor') {
			type_entity = google.maps.SymbolPath.CIRCLE;
		}
		else {
			type_entity = google.maps.SymbolPath.BACKWARD_CLOSED_ARROW;
		}


		// Create a marker per location, and put into markers array
		var marker = new google.maps.Marker({
			map: map,
			position: position,
			title: title,
			description: description,
			animation: google.maps.Animation.DROP,
			icon: {
				path: type_entity,
				scale: 5
			}
			// console.log(title);
			// console.log(position);
			//      icon: 'http://cdn.com/my-custom-icon.png' // null = default icon  *** another option to have especific icons
		});

		markers.push(marker);
		//Extend the boundaries of the map for each marker
		bounds.extend(marker.position);

		//Create an onClick event to open an infowindow on each marker
		marker.addListener('click',function(){
			populateInfoWindow(this, largeInfowindow, bounds);
		});
		//we close here the loop to create the array with the markers
	}
}

// This function populates the infowindow when the marker is clicked, we'll only allow
// one infowindow which will open at the marker that is clicked, and populate based
// on that markers position
function populateInfoWindow(marker, infowindow, bounds) {
	// Check to make sure that the infowindow is not already opended on this marker
	if (infowindow.marker != marker) {
		infowindow.marker = marker;
		//With the "infowindow" we can play around the css styles on the top of the file
		infowindow.setContent('<div id="infowindow"><strong>' + marker.title  + '</strong><br>' + marker.description + '</div>');
		infowindow.open(map, marker);

		// Make sure the marker is cleared if the infowindow is closed
		infowindow.addListener('closeclick',function(){
			infowindow.setMarker(null);
		});
	}
	// map.fitBounds(bounds);
}
	// $(document).on('ready turbolinks:load', ready);
	// window.initMap = ready;
