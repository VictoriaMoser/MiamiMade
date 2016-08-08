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

console.log('information to be send to request info');
console.log(data);

				$.ajax({
					url: '/get_filter',
					type: "GET",
					data: { data: data },
// we request the information to the controller
					success: function(data){
// if succesfull .. we get a variable data from the controller with all the data for the markers
						console.log('information receive from controller after request for the filtering part');
						console.log(data);

						var markersData = [];
// we will add the information from var Data into markersData in the right format for Googlemaps

						for (var i = 0; i < data.length; i++) {
							markersData.push([data[i].latitude, data[i].longitude]);
						}
						console.log('information contructed from the data received and ready to be use in the map')
						console.log(markersData);
// once we have the markers data we call the map function again to restart the map and add the new markers

						initMap(markersData);
					}
				});
		});
}); // function finishes here


function initMap(markers) {
	var lat = 26.00;
	var lng = -80.60;
	//we create the map center in south florida
	var map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: {lat: 26.80, lng: -80.90},
		zoom: 8
	});

 console.log('information of the markers to be use to populate the map');
 console.log(markers);

 console.log('if is the first run markets info should be:');
 console.log(gon.investorsLoc);
 console.log('all the information in startupsAll');
 console.log(gon.startupsAll);
 console.log(gon.investorsLoc[0],[0]);
 console.log(gon.investorsLoc[0],[1]);
 console.log(gon.investorsAll[0].latitude);

	// console.warn(markers);

	if (markers != undefined) {

		if (markers.length > 0) {

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
		console.log('this must run the first time with the investor markers');
		console.log(gon.investorsLoc);




		for (i in gon.investorsAll) {
			var pos = {lat: gon.investorsAll[i].latitude, lng: gon.investorsAll[i].longitude};
			var markers = new google.maps.Marker({
				position: pos,
				map: map
			});
		};

		for (i in gon.startupsAll) {
			var pos = {lat: gon.startupsAll[i].latitude, lng: gon.startupsAll[i].longitude};
			var markers = new google.maps.Marker({
				position: pos,
				map: map
			});
		};



	}
}
