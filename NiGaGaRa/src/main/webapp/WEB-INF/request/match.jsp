<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
</head>

<body>
	<div id="wrapper">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">부탁매칭</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-3"></div>

			<div class="col-md-6 panel-body container">
			<form action="/NiGaGaRa/payment.do" method="post" role="form" class="contactForm">
				<div class="form-group">
				<h4 id="gps" onclick="getLocation()">경로확인</h4>
					<input type="text" name="name" class="form-control" id="start"
						placeholder="출발지" readonly />
					<div class="validation"></div>
				</div>
				<div class="form-group">
					<input type="text" name="name" class="form-control" id="end"
						placeholder="도착지" readonly />
					<div class="validation"></div>
				</div>
				<p id="demo" type="hidden"></p>
				<div class="form-group" id="mapholder"></div>
				<div class="text-center">
					<button type="submit" class="btn btn-theme">매칭시작</button>
				</div>
				</form>
			</div>
			<div class="col-md-3"></div>

		</section>

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script
		src="https://maps.google.com/maps/api/js?key=AIzaSyC52np6oOXYzo7qPWLSnfCgupiYtuRW8ts"></script>
	<script>
		var x = document.getElementById("demo");
		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition,
						showError);
			} else {
				x.innerHTML = "이 브라우저에서는 지도를 지원하지 않습니다.";
			}
		}

		function showPosition(position) {
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			var latlon = new google.maps.LatLng(lat, lon)
			var mapholder = document.getElementById('mapholder')
			mapholder.style.height = '400px';
			mapholder.style.width = '100%';
			var myOptions = {
				center : latlon,
				zoom : 14,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				mapTypeControl : true,
				mapTypeControlOptions : {
					style : google.maps.MapTypeControlStyle.DROPDOWN_MENU
				}
			}

			var map = new google.maps.Map(document.getElementById("mapholder"),
					myOptions);
			var populationOptions = {
				strokeColor : '#000000',
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : '#808080',
				fillOpacity : 0.5,
				map : map,
				center : latlon,
				radius : $("#radius").val() * 1000
			};
			cityCircle = new google.maps.Circle(populationOptions);
			var infowindow = new google.maps.InfoWindow();

			marker = new google.maps.Marker({
				position : new google.maps.LatLng(lat, lon),
				map : map,
				title : "나임"
			});

			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
						}
					})(marker, i));

		}

		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				x.innerHTML = "User denied the request for Geolocation."
				break;
			case error.POSITION_UNAVAILABLE:
				x.innerHTML = "Location information is unavailable."
				break;
			case error.TIMEOUT:
				x.innerHTML = "The request to get user location timed out."
				break;
			case error.UNKNOWN_ERROR:
				x.innerHTML = "An unknown error occurred."
				break;
			}
		}
	</script>
	<script src="contactform/contactform.js"></script>

</body>

</html>
