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
						<form
							action="/NiGaGaRa/goods/edit.do?goods_Num=${requestdetail.goods_Num}"
							method="post" role="form" class="contactForm">
							
							<div class="form-group">
								보낸사람 우편번호<input id="sender_zipcode" name="sender_zipcode"
									type="text" value="${requestdetail.sender_zipcode}"
									class="form-control input-md" disabled="disabled"> <input
									class="btn btn-theme mb-2" type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
									disabled="disabled">
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
									class="form-control" disabled="disabled"> <input
									class="btn btn-theme mb-2" type="button"
									onclick="sample5_execDaumPostcode()" value="우편번호 찾기"
									disabled="disabled">
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
							<div class="text-center">
								<input type="button" class="btn btn-theme" onclick="modify()"
									value="상품 수정" />
								<button type="submit" class="btn btn-theme" disabled="disabled">확인</button>
							</div>
					</form>
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
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<!--우편API  -->
	<script type="text/javascript">
		function modify() {
			$(".form-group input").removeAttr("disabled")
			$(".form-group textarea").removeAttr("disabled")
			$(".text-center button").removeAttr("disabled")
		}
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sender_zipcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sender_Addr').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sender_Addr_detail').focus();
						}
					}).open();
		}
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('receiver_zipcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('receiver_Addr').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('receiver_Addr_detail')
									.focus();
						}
					}).open();
		}
	</script>
</body>

</html>
