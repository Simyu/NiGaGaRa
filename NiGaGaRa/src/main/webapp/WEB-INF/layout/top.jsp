<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" href="/NiGaGaRa/resources/css/chatbox.css">
</head>
<body>
	<!-- start header -->
	<header>
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/NiGaGaRa/index.do">
						<span>니</span>
						가가라(부탁~해요)
					</a>
				</div>
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li>
							<a href="/NiGaGaRa/index.do">Home</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown"
								data-hover="dropdown" data-delay="0" data-close-others="false">
								부탁하기
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="/NiGaGaRa/request.do">시작하기</a>
								</li>
								<li>
									<a href="#">조회하기</a>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown"
								data-hover="dropdown" data-delay="0" data-close-others="false">
								배달하기
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="/NiGaGaRa/delivery/start.do">시작하기</a>
								</li>
								<li>
									<a href="/NiGaGaRa/delivery.do">조회하기</a>
								</li>
								<li>
									<a href="/NiGaGaRa/delivery/qrread.do">QR리더기</a>
								</li>
								<li>
									<a href="#">이용방법</a>
								</li>
								<li>
									<a href="#">예상요금계산</a>
								</li>
							</ul>
						</li>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown"
								data-hover="dropdown" data-delay="0" data-close-others="false">
								마이페이지
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="/NiGaGaRa/goods/list.do?mem_id=${loginUser.mem_id }">신청이력</a>
								</li>
								<li>
									<a
										href="/NiGaGaRa/delivery/list.do?delivery_Man=<%-- ${deliverylist.delivery_Man } --%>">배달이력</a>
								</li>
								<li>
									<a
										href="/NiGaGaRa/member/profile.do?mem_id=${loginUser.mem_id }">내
										정보</a>
								</li>
								<li>

									<a href="/NiGaGaRa/member/drop.do">탈퇴</a>
								</li>
								<li>
									<a href="/NiGaGaRa/payment.do?mem_id=${loginUser.mem_id }">포인트
										결제</a>
								</li>
								<li>
									<a href="/NiGaGaRa/payment_list.do?mem_id=${loginUser.mem_id }">거래내역</a>
								</li>
							</ul>
						</li>

						<se:authorize access="isAnonymous()">
							<li>
								<a href="/NiGaGaRa/member/register.do">회원가입</a>
							</li>
							<li>
								<a href="/NiGaGaRa/member/login">로그인</a>
							</li>
						</se:authorize>
						<se:authorize access="isAuthenticated()">
							<li>
								<a href="/NiGaGaRa/member/logout.do">로그아웃</a>
							</li>
						</se:authorize>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->
	<div id="chatarea"></div>
	<script src="/NiGaGaRa/resources/js/apiai/ApiAi.js"></script>
	<script type="text/javascript">
		var client = new ApiAi.ApiAiClient({
			accessToken : 'ea14a92beff948b7a6bd92dab6d86653'
		});

		function sendText(text) {
			return client.textRequest(text);
		}
		
		function setResponseOnNode(text){

			var msg = '<div class="chatbox__body__message chatbox__body__message--left">'
					+ '<img src="/NiGaGaRa/resources/img/supportmale-2-512.png" alt="Picture">'
					+ '<p>'
					+ (text ? text : "[empty response]")
					+ '</p>' + '</div>';
			$(".chatbox__body").append(
					msg);
			$('.chatbox__body')
			.scrollTop(
					$(
							'.chatbox__body')
							.prop(
									'scrollHeight'));
		}

		$(document)
				.ready(
						function() {
							var chatarea = "<div class='chatbox chatbox--tray'>"
									+ "<div class='chatbox__title'>"
									+ "<h5>"
									+ "<a href=#'>"
									+ name
									+ "</a>"
									+ "</h5>"
									+ "<button class='chatbox__title__tray'>"
									+ "<span>"
									+ "</span>"
									+ "</button>"
									+ "<button class='chatbox__title__close'><span>"
									+ "<svg viewBox='0 0 12 12' width='12px' height='12px'>"
									+ "<line stroke='#FFFFFF' x1='11.75' y1='0.25' x2='0.25' y2='11.75'></line>"
									+ "<line stroke='#FFFFFF' x1='11.75' y1='11.75' x2='0.25' y2='0.25'></line>"
									+ "</svg></span></button></div><div class='chatbox__body'></div>"
									+ "<input type='text' class='chatbox__message' placeholder='Write something interesting'/></div>";

							$("#chatarea").append(chatarea);
							var $chatbox = $('.chatbox'), $chatboxTitle = $('.chatbox__title'), $chatboxTitleClose = $('.chatbox__title__close');

							$chatboxTitle.on('click', function() {
								$chatbox.toggleClass('chatbox--tray');
							});

							$chatboxTitleClose.on('click', function(e) {
								e.stopPropagation();
								$chatbox.addClass('chatbox--closed');
							});

							$chatbox.on('transitionend', function() {
								if ($chatbox.hasClass('chatbox--closed'))
									$chatbox.remove();
							});

							$('.chatbox__message')
									.keypress(
											function(e) {
												if (e.which == 13) {
													var str = $(this).val();
													var msg = '<div class="chatbox__body__message chatbox__body__message--right">'
															+ '<img src="/NiGaGaRa/resources/img/avatar.png" alt="Picture">'
															+ '<p>'
															+ str
															+ '</p>' 
															+ '</div>';
													$(".chatbox__body").append(
															msg);
													$(this).val("");
													$('.chatbox__body')
															.scrollTop(
																	$(
																			'.chatbox__body')
																			.prop(
																					'scrollHeight'));
													sendText(str)
												      .then(function(response) {
												        var result;
												        try {
												          result = response.result.fulfillment.speech
												        } catch(error) {
												          result = "";
												        }
												        setResponseOnNode(result);
												      })
												      .catch(function(err) {
												        setResponseOnNode("Something goes wrong");
												      });
												}
											});
							
						});
	</script>
</body>
</html>