$(function(){


// we have a duplication of data in this variables here and in the page index.html.erb >> refactoring
	var entity_list = ["Investor", "StartUp", "All entities"];
	var vertical_list = ["Advertising", "Apps", "Biotechnology", "Commerce and Shopping", "Community and Lifestyle", "Consumer Electronics", "Content and Publishing","Data and Analytics","Fashion","Financial Services","Food and Beverage","Government and Military","Hardware","Healthcare","Internet Services","Manufacturing","Media and Entertainment","Mobile","Software"];
	var founded_date_list = ["All dates","2012-Present", "2007-2011", "2002-2006"];
	var stage_list = ["All stages","Stage 1", "Stage 2", "Stage 3", "Stage 4"];
	var investorType_list = ["All investors","Angel Investor", "Venture Capitalist", "Peer-to-Peer Lending"];

// Here we create a request based on the selections on the filters
	$('button').on('click', function(){
			var formData = $('form').serialize();
			var begString = '&password='
			var endString = '=%E2%9C%93&term='

			var beforePass = formData.substring(formData.indexOf(begString));
			beforePass = beforePass.replace('&password=','');
			formData = beforePass.replace('=%E2%9C%93&term=','');
			formData = formData.replace(/&/g, " ");

			data = {
				entity: [],
				vertical: [],
				founded_date: [],
				stage: [],
				investorType: [],
			};

			for (i=0; i < entity_list.length; i++) {
				if (formData.indexOf(entity_list[i]) > -1) {
					data.entity.push(entity_list[i]);
				};
			};

			for (i=0; i < vertical_list.length; i++) {
				if (formData.indexOf(vertical_list[i]) > -1) {
					data.vertical.push(vertical_list[i]);
				};
			};

			for (i=0; i < founded_date_list.length; i++) {
				if (formData.indexOf(founded_date_list[i]) > -1) {
					data.founded_date.push(founded_date_list[i]);
				};
			};

			for (i=0; i < stage_list.length; i++) {
				if (formData.indexOf(stage_list[i]) > -1) {
					data.founded_date.push(stage_list[i]);
				};
			};


// data is an array with all the items selected in the filters ... now Ajax needs to
// send this to the controller in order to request the especic data from the model and then
// bring it back here to reset the markets and present new ones with the informations that comes


				$.ajax({
					url: '/get_filter',
					type: "GET",
					data: { data: data },
					// we request the information to the controller
					success: function(data){
					// if succesfull .. we get a variable data from the controller with all the data for the markers
							var markersData = data;
							console.log('information returning after filter');
							console.log(markersData);
							initMap(markersData);
					}
				});
		}); // function click
}); // main function finishes here

var markers = [];

function initMap(dataMarkers) {
	var lat = 26.00;
	var lng = -80.60;
	//we create the map center in south florida
	var map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: {lat: 26.80, lng: -80.90},
		zoom: 8
	});

	var largeInfowindow = new google.maps.InfoWindow();

	var bounds = new google.maps.LatLngBounds();

	function populateInfoWindow(marker, infowindow, bounds) {
		// Check to make sure that the infowindow is not already opened on this marker
		if (infowindow.marker != marker) {
				infowindow.marker = marker;
				//With the "infowindow" we can play around the css styles on the top of the file
				infowindow.setContent('<div id="infowindow"><p><strong>' + marker.name  + '</strong></p><br><hr>' + marker.description + '<br><hr>' + marker.website + '</div>');
				infowindow.open(map, marker);

				// Make sure the marker is cleared if the infowindow is closed
				infowindow.addListener('closeclick',function(){
					infowindow.setMarker(null);
				});
		};
		map.fitBounds(bounds);
	};



	if (dataMarkers !== undefined) {
		console.log('after filters');
		for (var i = 0; i < dataMarkers.length; i++) {
			var entity = dataMarkers[i];
			var pos = {lat: entity.latitude, lng: entity.longitude};
			// console.log(pos);

			var marker = new google.maps.Marker({
				map: map,
				position: pos,
				name: entity.name,
				description: entity.description,
				website: entity.website,
				email: entity.email,
				animation: google.maps.Animation.DROP,
			});

	    markers.push(marker);
	    bounds.extend(marker.position);
	    marker.addListener('click',function(){
	      populateInfoWindow(this, largeInfowindow, bounds);
	    });

		};
	} else {
		  // console.log('first run');
		  markers = [];
			for (i in gon.investorsAll) {
				var investor = gon.investorsAll[i];
				var pos = {lat: investor.latitude, lng: investor.longitude};
				// console.log(pos);
				var marker = new google.maps.Marker({
					position: pos,
					map: map,
					name: investor.name,
					description: investor.description,
					website: investor.website,
					email: investor.email,
					animation: google.maps.Animation.DROP,
				});
				markers.push(marker);
				bounds.extend(marker.position);
				marker.addListener('click',function(){
					populateInfoWindow(this, largeInfowindow, bounds);
				});
			};

			for (i in gon.startupsAll) {
				var startup = gon.startupsAll[i];
				var pos = {lat: startup.latitude, lng: startup.longitude};
				var marker = new google.maps.Marker({
					position: pos,
					map: map,
					name: startup.name,
					description: startup.description,
					website: startup.website,
					email: startup.email,
					animation: google.maps.Animation.DROP,
				});
				markers.push(marker);
				bounds.extend(marker.position);
				marker.addListener('click',function(){
					populateInfoWindow(this, largeInfowindow, bounds);
				});
			};
		};




} // init Map end
