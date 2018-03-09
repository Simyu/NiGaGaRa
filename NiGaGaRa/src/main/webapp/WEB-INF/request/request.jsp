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
					<form action="/NiGaGaRa/goods/insert.do" method="post" role="form"
						class="contactForm">
						<div class="form-group">
						<div class="form-group">
							<input type="text" name="sender_zipcode" class="form-control" id="senderZipcode"
								placeholder="보내는사람우편번호" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button class="btn btn-theme mb-2">검색</button>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="sender_Addr" class="form-control" id="senderAddr"
								placeholder="보내는사람 주소" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button type="#" class="btn btn-theme">검색</button>
							<div class="validation"></div>
						</div>
							<select name="delivery_Tool" class="form-control" id=deliveryTool
								data-msg="Please enter at least 4 chars">
								<option value="1">자동차</option>
								<option value="2">대중교통</option>
								<option value="3">자전거</option>
								<option value="4">도보</option>
							</select>
						</div>
						 
						<div class="form-group">
							<input type="text" name="receiver_Name" class="form-control" id="receiverName"
								placeholder="받는사람 이름" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="receiver_zipcode" class="form-control" id="receiverZipcode"
								placeholder="받는사람 우편번호" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button class="btn btn-theme mb-2">검색</button>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="receiver_Addr" class="form-control" id="receiverAddr"
								placeholder="받는사람 주소" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<button type="#" class="btn btn-theme">검색</button>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="receiver_Tel" class="form-control"
								id="receiverTel" placeholder="받는사람 전화번호" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="goods_Name" class="form-control"
								id="goodsName" placeholder="상품 이름" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<select name="weight" class="form-control" id="weight"
								data-msg="Please enter at least 4 chars">
								<option value="1">소 (5kg 이하)</option>
								<option value="2">중 (5~10kg)</option>
								<option value="3">대 (10kg 이상)</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="quantity" class="form-control" id="quantity"
								placeholder="수량" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="estimated_Price" class="form-control" id="estimatedPrice"
								placeholder="배송비" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="goods_Msg" rows="5"
								data-rule="required" data-msg="배송메세지는 필수입력입니다."
								placeholder="배송 메세지"></textarea>
							<div class="validation"></div>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-theme">상품등록</button>
						</div>
					</form>
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

</body>

</html>
