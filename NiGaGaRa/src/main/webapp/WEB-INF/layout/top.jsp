<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<!-- start header -->
	<header>
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html"><span>니</span>가가라(부탁~해요)</a>
				</div>
				<div class="navbar-collapse collapse ">
					<ul class="nav navbar-nav">
						<li><a href="/NiGaGaRa/index.do">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle "
							data-toggle="dropdown" data-hover="dropdown" data-delay="0"
							data-close-others="false">부탁하기 <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/NiGaGaRa/request.do">시작하기</a></li>
								<li><a href="#">조회하기</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle "
							data-toggle="dropdown" data-hover="dropdown" data-delay="0"
							data-close-others="false">배달하기 <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">시작하기</a></li>
								<li><a href="">조회하기</a></li>
								<li><a href="#">이용방법</a></li>
								<li><a href="#">예상요금계산</a></li>
							</ul></li>

						<%-- 	<%HttpSession ses = request.getSession();%>
						<%empDTO loginUser= (empDTO)ses.getAttribute("loginUser"); %>
						<%if(loginUser==null){ %> --%>
						<li class="dropdown"><a href="#" class="dropdown-toggle "
							data-toggle="dropdown" data-hover="dropdown" data-delay="0"
							data-close-others="false">마이페이지 <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">신청이력</a></li>
								<li><a href="#">배달이력</a></li>
								<li><a href="/NiGaGaRa/member/profile.do">내 정보</a></li>
								<li><a href="#">탈퇴</a></li>
								<li><a href="#">포인트 환전</a></li>
							</ul></li>
						
						<%-- <%else{ %> --%>
						<li><a href="/NiGaGaRa/member/register.do">회원가입</a></li>
						<li><a href="/NiGaGaRa/member/login.do">로그인</a></li>
						<%-- <%} %> --%>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->
</body>
</html>