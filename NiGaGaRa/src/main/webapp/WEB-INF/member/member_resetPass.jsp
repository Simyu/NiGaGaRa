<%-- <%@page import="emp.dto.empDTO"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	function check(){
		newpass = document.getElementById("newpass").value;
		newpasschk = document.getElementById("newpasschk").value;
		password = document.getElementById("password").value;
		<%-- <%empDTO login = (empDTO) session.getAttribute("loginUser");%> --%>
		<%-- sespass =<%=login.getPass()%> --%>
		if(password!=sespass){
			alert("���� ��й�ȣ�� Ʋ���ϴ�.");
			return false;
		}else if(newpass!=newpasschk){
			alert("���ο� ��й�ȣ�� �������� �ʽ��ϴ�.");
			return false;	
		}else{
			alert("��й�ȣ�� ����Ǿ����ϴ�.");
			return true;
		}
	}
</script>
<body>
	<form action="/danim/emp/ResetPass.do" method="POST" onsubmit="return check()">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>�ٴ� ȸ�� �н����� ����</h3>
			<div>
				<ul class="list-group">
					<li  class="list-group-item"><input type=password
						placeholder="���� ��й�ȣ" name="password" id="password"
						class="form-control input-md" required="required"/></li>
					<li class="list-group-item"><input id="newpass"  type=password
						placeholder="�� ��й�ȣ" name="newpass" class="form-control input-md"
						required="required"/></li>
					<li class="list-group-item"><input id="newpasschk"
						type=password placeholder="�� ��й�ȣ Ȯ��" name="newpasschk"
						class="form-control input-md" required="required"/></li>
				</ul>
				<input class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit" value ="�н����庯���ϱ�"/>
			</div>
		</div>
		<div class="col-md-2"></div>
	</form>
</body>

</html>
