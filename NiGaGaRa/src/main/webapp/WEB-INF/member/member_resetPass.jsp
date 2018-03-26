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
			alert("��濡��� 鍮�諛�踰��멸� ���쇳��吏� ���듬����.");
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
			<h3>�⑥�ㅼ���� 蹂�寃�</h3>
			<div>
				<ul class="list-group">
					<li class="list-group-item">
						<input type=password placeholder="���� 鍮�諛�踰���" name="password"
							id="password" class="form-control input-md" required="required" />
					</li>
					<li class="list-group-item">
						<input id="newpass" type=password placeholder="�� 鍮�諛�踰���"
							name="newpass" class="form-control input-md" required="required" />
					</li>
					<li class="list-group-item">
						<input id="newpasschk" type=password placeholder="�� 鍮�諛�踰��� ����"
							name="newpasschk" class="form-control input-md"
							required="required" />
					</li>
				</ul>
				<input class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit" value="�⑥�ㅼ����蹂�寃쏀��湲�" />
			</div>
		</div>
		<div class="col-md-2"></div>
	</form>
</body>

</html>
