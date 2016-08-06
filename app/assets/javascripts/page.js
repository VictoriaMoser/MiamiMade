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

$(document).on("turbolinks:load", function() {
  $('div.hidden').fadeIn(2000).removeClass('hidden');


  $('#logo').click(function() {
    $('div.hidden').removeClass('hidden');
  });

  //Register Submit in Modal
  function ready() {
    $('.modal-button').click(function() {
      $('.register-form').submit();
    });
  }

  //Login Submit in Modal
  function ready() {
    $('.modal-button').click(function() {
      $('.login-form').submit();
    });
  }
});



// old maps functionality
/*change map to map-canvas*/

// START HERE **************

// var map;
//
// var locations = [];
// var markers = [];
//
// function initMap(){
// 	map = new google.maps.Map(document.getElementById('map-canvas'), {
// 		center: {lat: 28.00, lng: -79.60},
// 		zoom: 7,
// 		scrollwheel: false
// 	});
//
//
//   $('.collapsible').collapsible({
//     accordion: false
//   });
//
//   $('.js-filter-box').on('click', function(e){
//     var filters = {
//       vertical: [],
// 			stage: []
//     }
//
//     $('.js-filter-box:checked').each(function(index, element){
//       var filterId = $(element).attr("value");
//       var category = $(element).attr("data-category");
//       // console.log($(element).attr("data-category"));
//       filters[category].push(filterId);
//     })
//
//     $.ajax({
//       url: '/filter',
// 			method: "POST",
//       data: filters,
//       success: businessMarkers
//     })
//
//   });
//
//
//
//
//
// 	// var investors = $('#map-data').data().investors;
// 	// var startups = $('#map-data').data().startups;
//
//
// 	var largeInfowindow = new google.maps.InfoWindow();
//
// 	var bounds = new google.maps.LatLngBounds();
// }
//
// // This function populates the infowindow when the marker is clicked, we'll only allow
// // one infowindow which will open at the marker that is clicked, and populate based
// // on that markers position
// function populateInfoWindow(marker, infowindow, bounds) {
// 	// Check to make sure that the infowindow is not already opended on this marker
// 	if (infowindow.marker != marker) {
// 		infowindow.marker = marker;
// 		//With the "infowindow" we can play around the css styles on the top of the file
// 		infowindow.setContent('<div id="infowindow"><strong>' + marker.title  + '</strong><br>' + marker.description + '</div>');
// 		infowindow.open(map, marker);
//
// 		// Make sure the marker is cleared if the infowindow is closed
// 		infowindow.addListener('closeclick',function(){
// 			infowindow.setMarker(null);
// 		});
// 	}
// 	map.fitBounds(bounds);
// }
//
// function businessMarkers(response) {
//   var largeInfowindow = new google.maps.InfoWindow();
//
// 	var bounds = new google.maps.LatLngBounds();
//
//   response.investors.forEach(function(investor) {
//     var location = {
//                     title: investor.name,
//                     position: {lat: investor.latitude, lng: investor.longitude },
//                     short_description: investor.shortdescription,
//                     address: investor.address,
//                     website: investor.website,
//                     founded: investor.founded_date,
//                     full_description: investor.description,
//                     vertical: investor.vertical,
//                     type:"investor"
//                   }
//
//                   var marker = new google.maps.Marker({
//                     map: map,
//                     position: location.position,
//                     title: location.title,
//                     description: location.short_description,
//                     animation: google.maps.Animation.DROP,
//                     icon: {
//                       // path: type_entity,
//                       scale: 5
//                     }
//                   });
//
//     markers.push(marker);
//     bounds.extend(marker.position);
//     marker.addListener('click',function(){
//       populateInfoWindow(this, largeInfowindow, bounds);
//     });
//   });
//   response.startups.forEach(function(startup) {
//     var location = {
//                     // title: startup.name,
//                     position: {lat: startup.latitude, lng: startup.longitude },
//                     // short_description: startup.shortdescription,
//                     address: startup.address,
//                     website: startup.website,
//                     founded: startup.founded_date,
//                     full_description: startup.description,
//                     vertical: startup.vertical,
//                     type:"startup"
//                   }
//                   var marker = new google.maps.Marker({
//                     map: map,
//                     position: location.position,
//                     title: startup.name,
//                     description: startup.short_description,
//                     animation: google.maps.Animation.DROP,
//                     icon: {
//                       // path: type_entity,
//                       scale: 5
//                     }
//                   });
//     markers.push(marker);
//     bounds.extend(marker.position);
//     marker.addListener('click',function(){
//       populateInfoWindow(this, largeInfowindow, bounds);
//     });
//   });
// }
