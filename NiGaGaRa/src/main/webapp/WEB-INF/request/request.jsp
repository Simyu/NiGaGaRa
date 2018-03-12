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
							<input id="sender_zipcode" name="sender_zipcode" type="text"
								placeholder="보내는 사람 우편번호" class="form-control input-md" readonly>
							<input class="btn btn-theme mb-2" type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input id="sender_Addr" name="sender_Addr" type="text"
								placeholder="보내는 사람 주소" class="form-control" readonly>
						</div>
						<div class="form-group">
							<input id="sender_Addr_detail" name="sender_Addr_detail" type="text"
								placeholder="보내는 사람 상세주소" class="form-control">
						</div>
						<div class="form-group">
							<select name="delivery_Tool" class="form-control" id=deliveryTool
								data-msg="Please enter at least 4 chars">
								<option value="자동차">자동차</option>
								<option value="대중교통">대중교통</option>
								<option value="자전거">자전거</option>
								<option value="도보">도보</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="receiver_Name" class="form-control"
								id="receiverName" placeholder="받는사람 이름" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input id="receiver_zipcode" name="receiver_zipcode" type="text"
								placeholder="받는사람 우편번호" class="form-control input-md" readonly>
							<input class="btn btn-theme mb-2" type="button"
								onclick="sample5_execDaumPostcode()" value="우편번호 찾기">
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input id="receiver_Addr" name="receiver_Addr" type="text"
								placeholder="받는사람 주소" class="form-control" readonly>
						</div>
						<div class="form-group">
							<input id="receiver_Addr_detail" name="receiver_Addr_detail" type="text"
								placeholder="받는사람 상세주소" class="form-control">
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
								<option value="소">소 (5kg 이하)</option>
								<option value="중">중 (5~10kg)</option>
								<option value="대">대 (10kg 이상)</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="quantity" class="form-control"
								id="quantity" placeholder="수량" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="estimated_Price" class="form-control"
								id="estimatedPrice" placeholder="배송비" data-rule="minlen:4"
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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!--우편API  -->
	<script type="text/javascript">
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
							document.getElementById('receiver_Addr_detail').focus();
						}
					}).open();
		}
	</script>
</body>

</html>
