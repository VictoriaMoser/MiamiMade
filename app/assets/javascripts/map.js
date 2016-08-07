$(function(){
	// 1. I have a button(click event)
		// 1.2 When I click the button I need to to get the values from the form
		// 1.3 Then I need to match those values to display specific data
	// 2.

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

			console.log(data);

				$.ajax({
					url: '/get_filter',
					type: "GET",
					data: { data: data },
					success: function(data){

						// when you made the call to the controller and then the controller
						// response with the data
						// You initalize the map here again!
						var latAndlong = [];
						for (var inv in data) {
							latAndlong.push([data[inv].latitude, data[inv].longitude]);
							// console.info(data[inv].latitude);
							// console.info(data[inv].longitude);
						}
						console.info(latAndlong);
						initMap(latAndlong);
					}
				});
		});
	});


function initMap(markers) {
	var lat = 26.00;
	var lng = -80.60;
	//we create the map center in south florida
	var map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: {lat: 26.80, lng: -80.90},
		zoom: 8
	});

// marker functionality from GoogleMaps
var marker = new google.maps.Marker({
	 position: myLatLng,
	 map: map,
	 title: 'Hello World!'
 });
 // end of the functionality




	console.warn(markers);

	if (markers != undefined) {
		if (markers.length > 0) {
			// console.log("here")
			// debugger;
			for (x in markers) {
				console.log(markers);
				if (markers[x] != undefined) {
					var pos = {lat: markers[x][0], lng: markers[x][1]};
				}
				var markers = new google.maps.Marker({
					position: pos,
					map: map
				});
			};
		}
	}else {
		for (x in gon.investorLoc) {
			var pos = {lat: gon.investorsLoc[x][0], lng: gon.investorsLoc[x][1]};
			var markers = new google.maps.Marker({
				position: pos,
				map: map
			});
		};
	}
}
