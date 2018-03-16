<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<!--  -->
<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css  -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
</head>
<style type="text/css">
body, input {
	font-size: 14pt
}

input, label {
	vertical-align: middle
}

.qrcode-text {
	padding-right: 1.7em;
	margin-right: 0
}

.qrcode-text-btn {
	display: inline-block;
	background:
		url(//dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/07/1499401426qr_icon.svg)
		50% 50% no-repeat;
	height: 1em;
	width: 1.7em;
	margin-left: -1.7em;
	cursor: pointer
}

.qrcode-text-btn>input[type=file] {
	position: absolute;
	overflow: hi dden;
	width: 1px;
	height: 1px;
	opacity: 0
}
</style>
<body>
	<div id="wrapper">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">QR리더기</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-3"></div>
			<form action="/NiGaGaRa/delivery/qrread.do" method="post" role="form"
				class="contactForm">
				<div class="col-md-6 panel-body container">
					<div class="row">
						<div class="form-group input-md">
							<input type=text style="width: 99%;" placeholder="QR코드를 스캔하십시오." class=qrcode-text
								readonly /> <label class=qrcode-text-btn><input
								type=file accept="image/*" capture=environment
								onclick="return showQRIntro();" onchange="openQRCamera(this);"
								tabindex=-2></label>
						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-theme">인증</button>
					</div>
				</div>
			</form>
			<div class="col-md-3"></div>
		</section>

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://rawgit.com/sitepoint-editors/jsqrcode/master/src/qr_packed.js"></script>
	<!-- QR리더API -->
	<script>
		function openQRCamera(node) {
			var reader = new FileReader();
			reader.onload = function() {
				node.value = "";
				qrcode.callback = function(res) {
					if (res instanceof Error) {
						alert("QR코드를 찾을 수 없습니다. 다시 카메라 화면안에 QR코드를 확인시켜주시기 바랍니다.");
					} else {
						node.parentNode.previousElementSibling.value = res;
					}
				};
				qrcode.decode(reader.result);
			};
			reader.readAsDataURL(node.files[0]);
		}

		function showQRIntro() {
			return confirm("당신의 카메라로 QR코드를 찍어주시기 바랍니다.");
		}
	</script>
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
	<script src="contactform/contactform.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</body>

</html>
