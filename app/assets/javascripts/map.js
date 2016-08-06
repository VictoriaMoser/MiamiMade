$(function(){
	// 1. I have a button(click event)
		// 1.2 When I click the button I need to to get the values from the form
		// 1.3 Then I need to match those values to display specific data
	// 2.

	var entity_list = ["Investor", "StartUp", "All Entities"];
	var vertical_list = ["Advertising", "Apps", "Biotechnology", "Commerce and Shopping", "Community and Lifestyle", "Consumer Electronics", "Content and Publishing","Data and Analytics","Fashion","Financial Services","Food and Beverage","Government and Military","Hardware","Healthcare","Internet Services","Manufacturing","Media and Entertainment","Mobile","Software"];
	var founded_date_list = ["All dates","2012-Present", "2007-2011", "2002-2006"];
	var stage_list = ["All stages","Stage 1", "Stage 2", "Stage 3", "Stage 4"];
	var investorType_list = ["All investors","Angel Investor", "Venture Capitalist", "Peer-to-Peer Lending"];


	$('button').on('click', function(){
			var formData = $('form').serialize();
			var begString = '&password='
			var endString = '=%E2%9C%93&term='

			var beforePass = formData.substring(formData.indexOf(begString));
			beforePass = beforePass.replace('&password=','');
			formData = beforePass.replace('=%E2%9C%93&term=','');

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

			for (i=0; i < investorType_list.length; i++) {
				if (formData.indexOf(investorType_list[i]) > -1) {
					data.founded_date.push(investorType_list[i]);
				};
			};

			console.log(data);

				$.ajax({
					url: '/',
					type: "GET",
					data: { data: data },
					success: function(data){
						// when you made the call to the controller and then the controller
						// response with the data
						// You initalize the map here again!
					}
				});
		});
	});


function initMap() {
	//we create the map center in south florida
	var map = new google.maps.Map(document.getElementById('map-canvas'), {
		center: {lat: 28.00, lng: -79.60},
		zoom: 8
	});

	// filter to understand the markers to create
	// if (filter array is equal to )





	for (x in gon.investors) {
		var pos = {lat: gon.investors[x][0], lng: gon.investors[x][1]};
		var markers = new google.maps.Marker({
			position: pos,
			map: map
		});
	};

	// console.log(gon.investorsAll);
	// console.log(gon.investorsAll[0].latitude); // latitud of the investor


	// console.log("investors location gon: ");
	// console.log(gon.investors);
	//
	// console.log("startups gon: ");
	// console.log(gon.startupsAll);
	//
	// console.log("Investors gon: ");
	// console.log(gon.investorsAll);


}
