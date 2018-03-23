<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
							<li class="active">상품 상세정보</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-3"></div>
			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>상세정보</h4>
					<div id="sendmessage">Your message has been sent. Thank you!</div>
					<div id="errormessage"></div>
					<c:forEach var="requestdetail" items="${requestdetail}"><!-- 이거대신 쓸수없는건가???? -->
						<div class="form-group">
								보낸사람 우편번호<input id="sender_zipcode" name="sender_zipcode"
									type="text" value="${requestdetail.sender_zipcode}"
									class="form-control input-md" disabled="disabled">
								<div class="validation"></div>
							</div>
							<div class="form-group">
								보낸사람 주소<input id="sender_Addr" name="sender_Addr" type="text"
									value="${requestdetail.sender_Addr}" class="form-control"
									disabled="disabled">
							</div>
							<div class="form-group">
								보낸사람 상세주소<input id="sender_Addr_detail" name="sender_Addr_detail"
									type="text" value="${requestdetail.sender_Addr_detail}" class="form-control" disabled="disabled">
							</div>
							<div class="form-group">
								배송수단<input id="delivery_Tool" name="delivery_Tool" type="text"
									value="${requestdetail.delivery_Tool}" class="form-control"
									disabled="disabled">
							</div>
							<div class="form-group">
								받는사람 이름<input id="receiver_Name" name="receiver_Name"
									type="text" value="${requestdetail.receiver_Name}"
									class="form-control" disabled="disabled">
							</div>
							<div class="form-group">
								받는사람 우편번호<input id="receiver_zipcode" name="receiver_zipcode"
									type="text" value="${requestdetail.receiver_zipcode}"
									class="form-control" disabled="disabled"> 
							</div>
							<div class="form-group">
								받는사람 주소<input id="receiver_Addr" name="receiver_Addr"
									type="text" value="${requestdetail.receiver_Addr}"
									class="form-control" disabled="disabled">
							</div>
							<div class="form-group">
								받는사람 상세주소<input id="receiver_Addr_detail" name="receiver_Addr_detail"
									type="text" value="${requestdetail.receiver_Addr_detail}" class="form-control" disabled="disabled">
							</div>
							<div class="form-group">
								받는사람 전화번호<input type="text" name="receiver_Tel"
									class="form-control" id="receiver_Tel"
									value="${requestdetail.receiver_Tel}" disabled="disabled">
							</div>
							<div class="form-group">
								상품이름<input type="text" name="goods_Name" class="form-control"
									id="goods_Name" value="${requestdetail.goods_Name}"
									disabled="disabled">
							</div>
							<div class="form-group">
								무게<input type="text" name="weight" class="form-control"
									id="weight" value="${requestdetail.weight}" disabled="disabled">
							</div>
							<div class="form-group">
								수량<input type="text" name="quantity" class="form-control"
									id="quantity" value="${requestdetail.quantity}"
									disabled="disabled">
							</div>
							<div class="form-group">
								배송비<input type="text" name="estimated_Price"
									class="form-control" id="estimated_Price"
									value="${requestdetail.estimated_Price}" disabled="disabled">
							</div>
							<div class="form-group">
								배송메세지
								<textarea class="form-control" name="goods_Msg" rows="5"
									disabled="disabled">${requestdetail.goods_Msg}</textarea>
							</div>
					</c:forEach>
				</div>
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
	<script src="contactform/contactform.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--우편API  -->

</body>

</html>
