<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<a class="navbar-brand" href="index.html">
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
									<a href="#">시작하기</a>
								</li>
								<li>
									<a href="#">조회하기</a>
								</li>
								<li>
									<a href="#">이용방법</a>
								</li>
								<li>
									<a href="#">예상요금계산</a>
								</li>
							</ul>
						</li>

						<%-- 	<%HttpSession ses = request.getSession();%>
						<%empDTO loginUser= (empDTO)ses.getAttribute("loginUser"); %>
						<%if(loginUser==null){ %> --%>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown"
								data-hover="dropdown" data-delay="0" data-close-others="false">
								마이페이지
								<b class=" icon-angle-down"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">신청이력</a>
								</li>
								<li>
									<a href="/NiGaGaRa/delivery/list.do?delivery_Man=<%-- ${deliverylist.delivery_Man } --%>">배달이력</a>
								</li>
								<li>
									<a href="/NiGaGaRa/member/profile.do">내 정보</a>
								</li>
								<li>

									<a href="/NiGaGaRa/member/drop.do">탈퇴</a>
								</li>
								<li>
									<a href="#">포인트 환전</a>
								</li>
								<li>
									<a href="/NiGaGaRa/payment/list.do">거래내역</a>
								</li>
							</ul>
						</li>
						

						<%-- <%else{ %> --%>
						<li>
							<a href="/NiGaGaRa/member/register.do">회원가입</a>
						</li>
						<li>
							<a href="/NiGaGaRa/member/login.do">로그인</a>
						</li>
						<%-- <%} %> --%>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->
	<div id="chatarea"></div>
	<script type="text/javascript">

	$(document).ready(function() {
		var chatarea = "<div class='chatbox chatbox--tray'><div class='chatbox__title'><h5><a href=#'>"

    	+name+"</a></h5><button class='chatbox__title__tray'><span></span></button>"
    	+"<button class='chatbox__title__close'><span>"
    	+"<svg viewBox='0 0 12 12' width='12px' height='12px'>"
    	+"<line stroke='#FFFFFF' x1='11.75' y1='0.25' x2='0.25' y2='11.75'></line>"
    	+"<line stroke='#FFFFFF' x1='11.75' y1='11.75' x2='0.25' y2='0.25'></line>"
    	+"</svg></span></button></div><div class='chatbox__body'></div>"
    	+"<input type='text' class='chatbox__message' placeholder='Write something interesting'/></div>";

    	$("#chatarea").append(chatarea);
		var $chatbox = $('.chatbox'),
		$chatboxTitle = $('.chatbox__title'),
		$chatboxTitleClose = $('.chatbox__title__close');
		
		$chatboxTitle.on('click', function() {
    		$chatbox.toggleClass('chatbox--tray');
  		});
		
        $chatboxTitleClose.on('click', function(e) {
            e.stopPropagation();
            $chatbox.addClass('chatbox--closed');
        });
    
    $chatbox.on('transitionend', function() {
        if ($chatbox.hasClass('chatbox--closed')) $chatbox.remove();
    });      
    
    $('.chatbox__message').keypress(function (e) {
        if (e.which == 13){
        	var str = $(this).val();
        	var msg = '<div class="chatbox__body__message chatbox__body__message--right">'
        	+'<img src="/NiGaGaRa/resources/img/avatar.png" alt="Picture">'
        	+'<p>'+str+'</p></div>';
        	$(".chatbox__body").append(msg);
        	$(this).val("");
    		$('.chatbox__body').scrollTop($('.chatbox__body').prop('scrollHeight'));
        }
    });
	});
	
	</script>
</body>
</html>