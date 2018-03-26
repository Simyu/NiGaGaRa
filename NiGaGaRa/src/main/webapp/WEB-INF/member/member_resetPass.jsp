<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<style type="text/css">
input {
	margin-bottom: 5px;
}

.btn.btn-signin {
	/*background-color: #4d90fe; */
	background-color: rgb(104, 145, 162);
	/* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
	padding: 0px;
	font-weight: 700;
	font-size: 14px;
	height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: none;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
}

.btn.btn-signin:hover, .btn.btn-signin:active, .btn.btn-signin:focus {
	background-color: rgb(12, 97, 33);
}
</style>
<script type="text/javascript">
	function check() {
		newpass = document.getElementById("newpass").value;
		newpasschk = document.getElementById("newpasschk").value;
		if (newpass != newpasschk) {
			alert("새로운 비밀번호가 동일하지 않습니다.");
			return false;
		}
		return true;
	}
</script>
<body>
	<form action="/NiGaGaRa/member/resetpass.do" method="POST"
		onsubmit="return check()">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>패스워드 변경</h3>
			<div>
				<ul class="list-group">
					<li class="list-group-item">
						<input type=password placeholder="현재 비밀번호" name="password"
							id="password" class="form-control input-md" required="required" />
					</li>
					<li class="list-group-item">
						<input id="newpass" type=password placeholder="새 비밀번호"
							name="newpass" class="form-control input-md" required="required" />
					</li>
					<li class="list-group-item">
						<input id="newpasschk" type=password placeholder="새 비밀번호 확인"
							name="newpasschk" class="form-control input-md"
							required="required" />
					</li>
				</ul>
				<input class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit" value="패스워드변경하기" />
			</div>
		</div>
		<div class="col-md-2"></div>
	</form>
</body>

</html>
