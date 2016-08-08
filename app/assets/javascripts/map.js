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
		};
		map.fitBounds(bounds);
	};



	if (dataMarkers !== undefined) {
		console.log('after filters');
		for (i in dataMarkers) {
			var pos = {lat: dataMarkers[i].latitude, lng: dataMarkers[i].longitude};
			console.log(pos);
			var marker = new google.maps.Marker({
				map: map,
				position: pos,
				title: dataMarkers[i].title,
				description: dataMarkers[i].short_description,
				animation: google.maps.Animation.DROP,
			});
			    markers.push(marker);
			    bounds.extend(marker.position);
			    marker.addListener('click',function(){
			      populateInfoWindow(this, largeInfowindow, bounds);
			    });
		};
	} else {
		  console.log('first run');
		  markers = [];
			for (i in gon.investorsAll) {
				var pos = {lat: gon.investorsAll[i].latitude, lng: gon.investorsAll[i].longitude};
				console.log(pos);
				var marker = new google.maps.Marker({
					position: pos,
					map: map,
					title: gon.investorsAll[i].name,
					description: gon.investorsAll[i].shortdescription,
					animation: google.maps.Animation.DROP,
				});
				markers.push(marker);
				bounds.extend(marker.position);
				marker.addListener('click',function(){
					populateInfoWindow(this, largeInfowindow, bounds);
				});
			};

			for (i in gon.startupsAll) {
				var pos = {lat: gon.startupsAll[i].latitude, lng: gon.startupsAll[i].longitude};
				var marker = new google.maps.Marker({
					position: pos,
					map: map,
					title: gon.startupsAll[i].name,
					description: gon.startupsAll[i].shortdescription,
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
