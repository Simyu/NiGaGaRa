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
<!-- 	<div id="wrapper">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">배송등록</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-3"></div>
			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>배송정보 입력</h4>

					<div id="sendmessage">Your message has been sent. Thank you!</div>
					<div id="errormessage"></div>
					<form action="/NiGaGaRa/match.do" method="post" role="form"
						class="contactForm">
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="getter"
								placeholder="받는사람 이름" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="getter"
								placeholder="받는사람 우편번호" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button class="btn btn-theme mb-2">검색</button>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="getter"
								placeholder="받는사람 주소" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button type="#" class="btn btn-theme">검색</button>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control"
								id="getterPhoneNum" placeholder="받는사람 전화번호" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="수령인 이메일" data-rule="email"
								data-msg="이메일 형식으로 입력해주세요." />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control"
								id="goodsName" placeholder="상품 이름" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<select name="name" class="form-control" id="weight"
								data-msg="Please enter at least 4 chars">
								<option value="">소 (5kg 이하)</option>
								<option value="">중 (5~10kg)</option>
								<option value="">대 (10kg 이상)</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="quantity"
								placeholder="수량" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="price"
								placeholder="배송비" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="msg" rows="5"
								data-rule="required" data-msg="배송메세지는 필수입력입니다."
								placeholder="배송 메세지"></textarea>
							<div class="validation"></div>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-theme">부탁해요</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-3"></div>

		</section>
	
	</div> -->
	<h3>결제 진행중... </h3>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
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
	var IMP = window.IMP; // 생략가능
	   IMP.init('imp36554497');  // 가맹점 식별 코드

	   IMP.request_pay({
	      pg : 'kakao', // 결제방식
	       pay_method : 'card',	// 결제 수단
	       merchant_uid : 'merchant_' + new Date().getTime(),
	      name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	       amount : '100',	// 결제 금액
	       buyer_email : '',	// 구매자 email
	      buyer_name :  '',	// 구매자 이름
	       buyer_tel :  '',	// 구매자 전화번호
	       buyer_addr :  '',	// 구매자 주소
	       buyer_postcode :  '',	// 구매자 우편번호
	       m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	   }, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
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
