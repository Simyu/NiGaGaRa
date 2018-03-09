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
<style type="text/css">
body, input {font-size:14pt}
input, label {vertical-align:middle}
.qrcode-text {padding-right:1.7em; margin-right:0}
.qrcode-text-btn {display:inline-block; background:url(//dab1nmslvvntp.cloudfront.net/wp-content/uploads/2017/07/1499401426qr_icon.svg) 50% 50% no-repeat; height:1em; width:1.7em; margin-left:-1.7em; cursor:pointer}
.qrcode-text-btn > input[type=file] {position:absolute; overflow:hi
dden; width:1px; height:1px; opacity:0}
</style>
<body>
	<h3>결제 진행중...</h3>
	
	<img src="http://chart.apis.google.com/chart?cht=qr&chs=400x400&chl=http://www.naver.com&choe=UTF-8">
	<!-- 구글chart api 사용 -- cht = qr / chs = 사이즈 /chl = 링크 /choe=잘안쓰지만 utf-8로 바꾸는-->
	
	<input type=text size=16 placeholder="QR스캔" class=qrcode-text readonly/>
	<label class=qrcode-text-btn><input type=file accept="image/*"
		capture=environment onclick="return showQRIntro();"
		onchange="openQRCamera(this);" tabindex=-1></label>
	<input type=button value="인증" disabled>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://rawgit.com/sitepoint-editors/jsqrcode/master/src/qr_packed.js"></script><!-- QR리더API -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	 <script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script><!-- 결제API  -->
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
		IMP.init('imp36554497'); // 가맹점 식별 코드

		IMP.request_pay({
			pg : 'kakao', // 결제방식
			pay_method : 'card', // 결제 수단
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명: 결제 테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
			amount : '100', // 결제 금액
			buyer_email : '', // 구매자 email
			buyer_name : '', // 구매자 이름
			buyer_tel : '', // 구매자 전화번호
			buyer_addr : '', // 구매자 주소
			buyer_postcode : '', // 구매자 우편번호
			m_redirect_url : '/khx/payEnd.action' // 결제 완료 후 보낼 컨트롤러의 메소드명
		}, function(rsp) {
			if (rsp.success) { // 성공시
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
	<script src="contactform/contactform.js"></script>

</body>

</html>
