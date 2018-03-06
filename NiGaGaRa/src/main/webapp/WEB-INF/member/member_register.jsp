<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/NiGaGaRa/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="/NiGaGaRa/resources/css/jcarousel.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/flexslider.css" rel="stylesheet" />
<link href="/NiGaGaRa/resources/css/style.css" rel="stylesheet" />
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		$("#birth").datepicker({
			dateFormat : 'yy/mm/dd',
			changeMonth : true,
			changeYear : true,
			yearRange : '-100y:c+nn',
			maxDate : '-1d'
		});

		$("#idcheck").on("click", function() {
			var querydata = {
				"id" : $("#id").val()
			}
			$.ajax({
				url : "/danim/emp/idDuplicateCheck.do", //아이디 인증하는 곳 수정요
				type : "get",
				data : querydata,
				dataType : "text",
				success : success_run,
				error : err_run

			});
		});

		$("#btnConfirm").on("click", function() {
			var text1 = $("#confirm").val();
			var text2 = $("#confirmEmail").val()

			if (text1 == text2) {
				$("#confirmflag").val("true");
				alert("이메일 인증이 완료되었습니다.");
				$("#confirmMsg").text("인증완료");

			} else {
				$("#confirmflag").val("false");
				alert("인증번호가 틀립니다.")
				$("#confirmMsg").text("인증실패(재인증필요)");
			}

		});
	});

	function success_run(txt) {

		if (txt == 1) {
			alert("사용가능한 아이디입니다.");
			$("#result").text("사용가능한 아이디입니다.");
			document.getElementById("idDuplicateCheck").setAttribute("value",
					true);
			alert(document.getElementById("idDuplicateCheck").value);
		} else {
			alert("사용불가한 아이디입니다.");
			$("#result").text("사용불가한 아이디입니다.");
		}
	}

	function err_run(obj, msg, statusMsg) {
		alert("오류발생 : " + obj + msg + statusMsg);
	}

	function success_runCert(certText) {

		$("#sendMsg").text("해당 메일로 인증번호가 발송되었습니다.");

		$("#confirmEmail").val(certText);

	}

	function Check() {
		var idDuplicateCheck = document.getElementById("idDuplicateCheck").value;
		var pass = document.getElementById("pass").value;
		var passchk = document.getElementById("passchk").value;

		var emailconfirm = document.getElementById("confirmflag").value;
		var agree1 = document.getElementById("agree1").checked;
		var agree2 = document.getElementById("agree2").checked;

		if (idDuplicateCheck == "false") {
			alert("중복여부를 체크해주세요");
			return false;
		} else if (pass != passchk) {
			alert("비밀번호를 다시입력해주세요");
			return false;
		} else if (emailconfirm == "false") {
			alert("이메일 인증 해주세요");
			return false;
		} else if (agree1 == false) {
			alert("이용약관동의를 해주세요");
			return false;
		} else if (agree2 == false) {
			alert("개인정보 수집 및 이용동의를 해주세요");
			return false;
		} else {
			alert("회원가입완료")
			return true;
		}
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
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>


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

</head>
<body>
	<form action="/danim/emp/register.do" method="post"
		enctype="multipart/form-data" onsubmit="return Check()">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<h4>회원가입</h4>
			<div>
				<ul class="list-group">
					<li class="list-group-item">
						<input id="id" name="id" type="text" placeholder="아이디"
							class="form-control input-md" required="required">
						<button type="button" id="idcheck">중복체크</button>
						<span id="result"></span>
					</li>
					<li class="list-group-item">
						<input id="pass" name="pass" type="password" placeholder="패스워드"
							class="form-control input-md" required="required">
					</li>
					<li class="list-group-item">
						<input id="passchk" name="passchk" type="password"
							placeholder="패스워드 확인" class="form-control input-md"
							required="required">
					</li>
					<li class="list-group-item">
						<input id="name" name="name" type="text" placeholder="이름"
							class="form-control input-md" required="required">
					</li>
					<li class="list-group-item">
						<input type="radio" name="gender" value="남자" checked="checked">
						남자
						<span> </span>
						<input type="radio" name="gender" value="여자">
						여자
					</li>
					<li class="list-group-item">
						<input id="birth" name="birth" type="text" placeholder="생년월일 "
							class="form-control input-md" required="required">
					</li>
					<li class="list-group-item">
						<input id="phone" name="phone" type="text" placeholder="전화번호"
							class="form-control input-md" required="required">
					</li>


					<li class="list-group-item">
						<input id="sample6_postcode" name="postno" type="text"
							placeholder="우편번호" class="form-control input-md">
						<input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기">
					</li>
					<li class="list-group-item">
						<input id="sample6_address" name="address" type="text"
							placeholder="주소" class="form-control input-md">
						<input id="sample6_address" name="address_detail" type="text"
							placeholder="상세주소" class="form-control input-md">
					</li>
					<li class="list-group-item">
						프로필 사진
						<input id="Uploadphoto" name="Upload photo"
							class="form-control input-md input-file" type="file">
					</li>

					<li class="list-group-item">
						<input type="checkbox" id="agree1">
						이용약관동의
						<span> </span>
						<input type="button" value="내용보기" />
					</li>
					<li class="list-group-item">
						<input type="checkbox" id="agree2">
						개인정보 수집 및 이용동의
						<span> </span>
						<input type="button" value="내용보기" />
					</li>
					<li class="list-group-item">
						<input type="checkbox" id="agree3">
						우편번호와 주소 수집 및 이용 동의
						<span></span>
					</li>
					<input class="btn btn-lg btn-primary btn-block btn-signin"
						type="submit" value="Sign in" />
					<input type="text" id="idDuplicateCheck" value="false" hidden="" />
				</ul>

			</div>
		</div>
		<div class="col-md-2"></div>

	</form>
</body>
</html>



