<%-- <%@page import="emp.dto.empDTO"%> --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="/NiGaGaRa/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="/NiGaGaRa/resources/css/jcarousel.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/flexslider.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/style.css" rel="stylesheet" />
<title>User profile form requirement</title>
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
    Bootstrap Core CSS
    <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
 -->
<!-- Custom CSS -->
<style>

body {
	
	
}

.othertop {
	margin-top: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function modify(str){
		location.replace(str);
		
	}
	
</script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-10 ">
				<form class="form-horizontal">
					<fieldset>

						<!-- Form Name -->
						<legend>회원 프로필</legend>
						<%-- <%empDTO dto = (empDTO)session.getAttribute("loginUser");%> --%>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="id">아이디</label>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-user"> </i>
									</div>
									<input id="id" name="id" type="text"
										value="<%-- <%=dto.getId() %> --%>"
										class="form-control input-md" disabled="disabled">
								</div>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="Name (Full name)">이름</label>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-user"> </i>
									</div>
									<input id="name" name="name" type="text"
										value="<%-- <%=dto.getName() %> --%>"
										class="form-control input-md" disabled="disabled">
								</div>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="Date Of Birth">생년월일</label>
							<div class="col-md-4">

								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-birthday-cake"></i>

									</div>
									<input id="Date Of Birth" name="Date Of Birth" type="text"
										value="<%-- <%=dto.getBirth() %> --%>"
										class="form-control input-md" disabled="disabled">
								</div>


							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="Gender (Full name)">성별</label>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-user"> </i>
									</div>
									<input id="Gender" name="Gender" type="text"
										value="<%-- <%=dto.getGender() %> --%>"
										class="form-control input-md" disabled="disabled">
								</div>
							</div>
						</div>


						<div class="form-group">
							<label class="col-md-4 control-label col-xs-12"
								for="Permanent Address">주소</label>
							<div class="col-md-4  col-xs-4">
								<textarea class="form-control" rows="2"
									id="Overview (max 100 words)" name="Overview (max 100 words)"
									disabled="disabled"><%-- <%=dto.getAddr()+" "+dto.getAddr_detail()%> --%></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 control-label col-xs-12"
								for="Permanent Address">상세주소</label>
							<div class="col-md-4  col-xs-4">
								<textarea class="form-control" rows="2"
									id="Overview (max 100 words)" name="Overview (max 100 words)"
									disabled="disabled"><%-- <%=dto.getAddr()+" "+dto.getAddr_detail()%> --%></textarea>
							</div>
						</div>


						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="Phone number ">전화번호</label>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-phone"></i>

									</div>
									<input id="Phone number " name="Phone number " type="text"
										value="<%-- <%=dto.getPhone()%> --%>"
										class="form-control input-md" disabled="disabled">

								</div>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="Email Address">이메일주소</label>
							<div class="col-md-4">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-envelope-o"></i>

									</div>
									<input id="Email Address" name="Email Address" type="text"
										value="<%-- <%=dto.getEmail() %> --%>"
										class="form-control input-md" disabled="disabled">

								</div>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" for="Email Address"></label>
							<div class="col-md-4">
								<div class="input-group">

									<div class="text-center"><input type="button" class="btn btn-theme" onclick="modify('/NiGaGaRa/member/modify.do')" value="프로필 수정"/></div>

								</div>

							</div>
						</div>



					</fieldset>
				</form>
			</div>
			<div class="col-md-2 hidden-xs">
				<img src="<%-- <%=dto.getProfileimg() %> --%>"
					class="img-responsive img-thumbnail ">
			</div>


		</div>

	</div>
	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
