<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	var idverifyflag = false;
	$(document).ready(function() {
		$("#birth").datepicker({
			dateFormat : 'yy/mm/dd',
			changeMonth : true,
			changeYear : true,
			yearRange : '-100y:c+nn',
			maxDate : '-1d'
		});
		$("#phone").on("keyup", function() {
			phone();
		});
		$("#mail").on("keyup", function() {
			mail();
		});
		$("#write").on("click", function() {
			write();
		})
		$("#numberchk").on("click", function() {
			numberchk();
		})
		$("#idcheck").on("click", function() {
			idcheck();
		});
		$("#pass").on("keyup", function() {
			pass();
		});
		$("#passchk").on("keyup", function() {
			passchk();
		})
		$("#id").on("keyup", function() {
			id();
		})
		$("#numberchk").on("click", function() {
			alert("인증번호가 발송되었습니다.")
		})
		$("#account").on("click", function() {
			getTokenByClientCredentials();
		})

	});
	function phone() {
		var pattern = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var phone = $("#phone").val();
		if (!pattern.test(콜)) {
			$("#phoneresult").text("전화번호 형식이 맞지 않습니다.");
			return false;
		}
		$("#phoneresult").text("전화번호 형식이 맞습니다.");
		return true;
	}
	function mail() {
		var pattern = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		var mail = $("#mail").val();
		if (!pattern.test(mail)) {
			$("#emailresult").text("이메일 형식이 맞지 않습니다.");
			return false;
		}
		$("#emailresult").text("이메일 형식이 맞습니다.");
		return true;
	}
	function write() {
		if ($("#mailchk").val() != emailRandNum) {
			$("#mailchkresult").text("인증번호가 다릅니다")
			return false;
		} else {
			$("#mailchkresult").text("")
			alert("성공하였습니다.")
			return true;
		}
	}

	function numberchk() {
		emailRandNum = Math.floor(Math.random() * 1000000);
		$.ajax({
			url : "/NiGaGaRa/member/emailchk.do",
			type : "POST",
			data : {
				"number" : emailRandNum,
				"mem_email" : $("#mail").val()
			},
			dataType : "text",
			success : function(resp) {
				$("#numberchkresult").text(resp);
			}
		})
	}
	idcheckRet = false;
	function idcheck() {
		if (id()) {

			var querydata = {
				"id" : $("#id").val()
			}

			$.ajax({
				url : "/NiGaGaRa/member/idDuplicateCheck.do", //아이디 인증하는 곳 수정요
				type : "get",
				data : querydata,
				dataType : "text",
				success : function(resp) {
					if (resp == "F") {
						$("#result").text("사용 불가능한 ID입니다.")
						idcheckRet = false;
					} else if (resp == "T") {
						$("#result").text("사용 가능한 ID입니다.")
						idcheckRet = true;
					}
				}
			});
		}
	}
	function pass() {
		var id = $("#id").val();

		var password = $("#pass").val();

		if (!/^[a-zA-Z0-9]{10,15}$/.test(password)) {

			$("#passresult").html('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
			return false;
		}
		var checkNumber = password.search(/[0-9]/g);

		var checkEnglish = password.search(/[a-z]/ig);

		if (checkNumber < 0 || checkEnglish < 0) {

			$("#passresult").html("숫자와 영문자를 혼용하여야 합니다.");
			return false;
		}
		if (/(\w)\1\1\1/.test(password)) {

			$("#passresult").html('같은 문자를 4번 이상 사용하실 수 없습니다.');
			return false;
		}
		if (password.search(id) > -1) {

			$("#passresult").html("비밀번호에 아이디가 포함되었습니다.");
			return false;

		}
		$("#passresult").html("");
		return true;
	}
	function passchk() {
		var pass = $("#pass").val();
		var passchk = $("#passchk").val();
		if (pass != passchk) {
			$("#passchkresult").text("비밀번호가 일치하지 않습니다.");
			return false;
		}
		$("#passchkresult").text("비밀번호가 동일합니다.");
		return true
	}
	function id() {
		var id = $("#id").val();
		var checkNumber = id.search(/[0-9]/g);
		var checkEnglish = id.search(/[a-z]/ig);
		if (id.length<6||id.length>10 && /^[a-zA-Z]{1}[a-zA-Z0-9_]/
				&& checkNumber < 0 || checkEnglish < 0) {
			$("#result").text("아이디는 5자이상 10자이하 여야하며 영문과 숫자가 1개이상 들어가야합니다.");
			return false;
		} else {
			$("#result").text("")
			return true;
		}
	}
	function execDaumPostcode() {
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
						document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('mem_addr').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('mem_addr_detail').focus();
					}
				}).open();
	}
	function inputVerify() {
		if (phone() && mail() && id() && idcheckRet && write() && passchk()
				&& pass()) {
			return true;
		} else {
			alert("제대로 입력해 주세요.");
			return false;
		}
	}
	function isGatewayException(data){
		
		if(data 
			&& data.rsp_code 
			&& data.rsp_code.indexOf('A') !== 0 // API업무처리 응답코드를 제외한 응답코드
		){

			var delim = '___';
			var addMsg = delim;
			
			// 오류코드 추출 (메인)
			var rsp_code = data.rsp_code;
//			dc('## rsp_code: '+rsp_code);
			
			var rsp_code_desc = gwRspCode[rsp_code] ? gwRspCode[rsp_code].rsn : '';
			dc('## rsp_code_desc: '+rsp_code_desc);
			addMsg += '<p>' + rsp_code_desc + '</p>';

			// 오류코드 추출 (세부)
			var rsp_message = data.rsp_message;
//			dc('## rsp_message: '+rsp_message);
			
			var rsp_dtl_code, rsp_dtl_code_desc;
			var cdStaIdx = rsp_message.indexOf('(['); 
			var cdEndIdx = rsp_message.indexOf('])'); 
			if(cdStaIdx >= 0){
				rsp_dtl_code = rsp_message.substring(cdStaIdx + 2, cdEndIdx);
				rsp_dtl_code_desc = gwRspDtlCode[rsp_dtl_code] ? gwRspDtlCode[rsp_dtl_code].rsn : '';
				addMsg += '<p>&nbsp;&nbsp;-&nbsp;' + rsp_dtl_code_desc + '</p>';
//				dc('## rsp_dtl_code: '+rsp_dtl_code);
				dc('## rsp_dtl_code_desc: '+rsp_dtl_code_desc);
			}
			
			showMsg(js(data) + ((addMsg == delim) ? '' : addMsg));
			
			return true;
		}
		return false;
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
	<form action="/NiGaGaRa/member/register.do" method="post"
		enctype="multipart/form-data" onsubmit="return inputVerify();">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<h4>회원가입</h4>
			<div>
				<ul class="list-group">
					<li class="list-group-item">
						<input id="id" name="mem_id" type="text" placeholder="아이디"
							class="form-control input-md" required="required">
						<button type="button" id="idcheck" class="btn btn-theme">중복체크</button>
						<span id="result"></span>
					</li>
					<li class="list-group-item">
						<input id="pass" name="mem_pw" type="password" placeholder="패스워드"
							class="form-control input-md" required="required">
						<span id="passresult"></span>
					</li>
					<li class="list-group-item">
						<input id="passchk" name="mem_pw_chk" type="password"
							placeholder="패스워드 확인" class="form-control input-md"
							required="required">
						<span id="passchkresult"></span>
					</li>
					<li class="list-group-item">
						<input id="name" name="mem_name" type="text" placeholder="이름"
							class="form-control input-md" required="required">
					</li>
					<li class="list-group-item">
						<input type="radio" name="mem_gender" value="남자" checked="checked">
						남자
						<span> </span>
						<input type="radio" name="mem_gender" value="여자">
						여자
					</li>
					<li class="list-group-item">
						<input id="birth" name="mem_birth" type="text" placeholder="생년월일 "
							class="form-control input-md" required="required">
					</li>
					<li class="list-group-item">
						<input id="phone" name="mem_phone" type="text" placeholder="전화번호"
							class="form-control input-md" required="required">
						<span id=phoneresult></span>
					</li>

					<li class="list-group-item">
						<input id="mail" name="mem_email" type="text" placeholder="이메일"
							class="form-control input-md" required="required">
						<span id="emailresult"></span>
						<input id="mailchk" type="text" placeholder="인증번호"
							class="form-control input-md" required="required">
						<input type="button" class="btn btn-theme" id="numberchk"
							value="인증번호받기">
						<input type="button" class="btn btn-theme" id="write" value="입력하기">
					</li>


					<li class="list-group-item">
						<input id="mem_zipcode" name="mem_zipcode" type="text"
							placeholder="우편번호" class="form-control input-md"
							onclick="execDaumPostcode()">
						<input id="mem_addr" name="mem_addr" type="text" placeholder="주소"
							class="form-control input-md">
						<input id="mem_addr_detail" name="mem_addr_detail" type="text"
							placeholder="상세주소" class="form-control input-md">
					</li>
					<li class="list-group-item">
						<input id="Uploadphoto" name="file"
							class="form-control input-md input-file" type="file">
					</li>
					<li class="list-group-item">
						<input id="account" name="mem_account" type="text"
							placeholder="계좌번호" class="form-control input-md"
							required="required">
						<input type="button" class="btn btn-theme" id="account_btn"
							value="인증조회" onclick="getTokenByClientCredentials()">
					</li>

					<li class="list-group-item">
						<input type="checkbox" id="agree1">
						이용약관동의
						<span> </span>
						<input type="button" class="btn btn-theme" value="내용보기" />
					</li>
					<li class="list-group-item">
						<input type="checkbox" id="agree2">
						개인정보 수집 및 이용동의
						<span> </span>
						<input type="button" class="btn btn-theme" value="내용보기" />
					</li>
					<li class="list-group-item">
						<input type="checkbox" id="agree3">
						우편번호와 주소 수집 및 이용 동의
						<span></span>
					</li>

					<input class="btn btn-lg btn-primary btn-block btn-signin"
						type="submit" value="Sign in" />
					<input type="text" id="id_duplicate_check" value="false" hidden="" />
				</ul>

			</div>
		</div>

	</form>
	
<script type="text/javascript">
function pad2(n) { return n < 10 ? '0' + n : n }
function getTokenByClientCredentials() {

	$.ajax({
		url : 'https://testapi.open-platform.or.kr/oauth/2.0/token',
		type : 'post',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		data : {
			'client_id' : 'l7xx4542423c4fac41b18abd22d39d99c3cf',
			'client_secret' : '1b3efbffaaa645ad86a0bfc0f01dcd14',
			'grant_type' : 'client_credentials',
			'scope' : 'oob'
		}
	}).done(function(data, textStatus, jqXHR) {
		if (isGatewayException(data)) {
			return;
		}
		
		var date = new Date();
		var date_data = date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2( date.getDate()) + pad2( date.getHours() ) + pad2( date.getMinutes() ) + pad2( date.getSeconds() );
		var src = {
				'account_num' : '1234567890123456',
				'bank_code_std' : '001',
				'account_holder_info' : '8801011',
				'tran_dtime' : date_data
		};
		
		$.ajax({
			url : 'https://testapi.open-platform.or.kr/inquiry/real_name',
			type : 'post',
			headers : {
				'Authorization' : ('Bearer ' + data.access_token)
			},
			data : JSON.stringify(src, null, 4)
			
		}).done(function(data, textStatus, jqXHR) {
			if (isGatewayException(data)) {
				return;
			} // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.      

			// UI에 결과값 바인딩
			alert(data.account_holder_name);
		});
	});
}

</script>
</body>
</html>


