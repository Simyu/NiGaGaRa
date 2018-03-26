<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>User profile form requirement</title>
<!-- Custom CSS -->
<style>
body {
	
}

.othertop {
	margin-top: 10px;
}

#fileinput {
	display: none;
}
</style>

</head>

<body>
	<div id="wrapper">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li>
								<a href="#">
									<i class="fa fa-home"></i>
								</a>
								<i class="icon-angle-right"></i>
							</li>
							<li class="active">마이페이지</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="row">
				<div>
					<form class="form-horizontal" enctype="multipart/form-data"
						action="/NiGaGaRa/member/modify.do" method="post">
						<!-- Form Name -->
						<br />
						<br />
						<br />
						<div class="col-md-2 hidden-xs text-center">
							<div class="row" id="imgholder">
								<img src="/NiGaGaRa/resources/img/upload/${user.mem_img }"
									class="img-responsive img-thumbnail " id="img">
							</div>
							<div id="fileupload" class="row" hidden="hidden">
								<input type="file" id="fileinput" name="file" accept="image/*">
								<input type="button" id="fackfileupbtn" class="btn btn-theme"
									value="프로필 사진 수정">
							</div>
						</div>
						<fieldset class="col-md-10">
							<!-- Text input-->
							<input type="hidden" name="mem_id" value="${user.mem_id }">
							<input type="hidden" id="fileflag" name="fileflag" value="F">
							<div class="form-group">
								<label class="col-md-2 control-label" for="Name (Full name)">이름</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"> </i>
										</div>
										<input name="mem_name" type="text" value="${user.mem_name }"
											class="form-control input-md" disabled="disabled">
									</div>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Date Of Birth">생년월일</label>
								<div class="col-md-5">

									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-birthday-cake"></i>

										</div>
										<input id="mem_birth" name="mem_birth" type="text"
											value="${user.mem_birth }" class="form-control input-md"
											disabled="disabled">
									</div>


								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Gender (Full name)">성별</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"> </i>
										</div>
										<input id="gender" type="text" value="${user.mem_gender }"
											class="form-control input-md" disabled="disabled">
										<div id="gendergroup" style="display: none;"
											class="form-control input-md">
											<input id="man" type="radio" name="mem_gender" value="남자">
											남자
											<input id="woman" type="radio" name="mem_gender" value="여자">
											여자
										</div>
									</div>
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-2 control-label" for="Permanent Address">주소</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fas fa-map-marker"></i>

										</div>
										<input id="mem_addr_show" type="text"
											value="(${user.mem_zipcode }) ${user.mem_addr }"
											class="form-control input-md" onclick="execDaumPostcode()"
											disabled="disabled">
										<input type="hidden" id="mem_zipcode" name="mem_zipcode"
											value="${user.mem_zipcode }">
										<input type="hidden" id="mem_addr" name="mem_addr"
											value="${user.mem_addr }">

										<input name="mem_addr_detail" type="text"
											value="${user.mem_addr_detail }"
											class="form-control input-md" disabled="disabled">

									</div>
								</div>
							</div>


							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Phone number ">전화번호</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-phone"></i>

										</div>
										<input name="mem_phone" type="text" value="${user.mem_phone }"
											class="form-control input-md" disabled="disabled">

									</div>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Email Address">이메일주소</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-envelope-o"></i>

										</div>
										<input name="mem_email" type="text" value="${user.mem_email }"
											class="form-control input-md" disabled="disabled">

									</div>

								</div>
							</div>


							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="Email Address">계좌번호</label>
								<div class="col-md-5">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fas fa-university"></i>
										</div>

										<select class="form-control" name="mem_bank_code"
											id="bank_code" style="display: none;">
											<c:choose>
												<c:when test="${user.mem_bank_code == '001' }">
													<c:set var="bank_code" value="국민은행" />
													<option value="001" selected="selected">국민은행</option>
													<option value="002">우리은행</option>
													<option value="003">신한은행</option>
												</c:when>
												<c:when test="${user.mem_bank_code == '002' }">
													<c:set var="bank_code" value="우리은행" />
													<option value="001">국민은행</option>
													<option value="002" selected="selected">우리은행</option>
													<option value="003">신한은행</option>
												</c:when>
												<c:when test="${user.mem_bank_code == '003' }">
													<c:set var="bank_code" value="신한은행" />
													<option value="001">국민은행</option>
													<option value="002">우리은행</option>
													<option value="003" selected="selected">신한은행</option>
												</c:when>
											</c:choose>
										</select>

										<input id="bank_code_show" type="text" value="${bank_code}"
											class="form-control input-md" disabled="disabled">

										<input name="mem_account" type="text"
											value="${user.mem_account }" class="form-control input-md"
											disabled="disabled">

									</div>

								</div>
							</div>

						</fieldset>
						<div class="text-center">
							<input type="button" class="btn btn-theme" value="프로필 수정"
								id="modifyview" />
							<a class="btn btn-theme"
								href="/NiGaGaRa/member/profile.do?mem_id=${user.mem_id }"
								style="display: none;" id="cancle">취소하기</a>
							<input type="submit" class="btn btn-theme" style="display: none;"
								value="수정완료" id="submit">

							<a class="btn btn-theme" href="/NiGaGaRa/member/resetpass.do">비밀번호
								바꾸기 </a>
						</div>
					</form>
				</div>

			</div>
		</div>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#modifyview")
										.on(
												"click",
												function() {
													$(".form-group input")
															.removeAttr(
																	"disabled");
													$("#fileupload")
															.removeAttr(
																	"hidden");
													$("#modifyview").css(
															"display", "none");
													$("#gender").css("display",
															"none");
													$("#gendergroup").css(
															"display", "block");
													$("#submit").css("display",
															"inline");
													$("#cancle").removeAttr(
															"style");

													if ($("#gender").val() == "남자") {
														$("#man").attr(
																"checked",
																"checked");
													} else {
														$("#woman").attr(
																"checked",
																"checked");
													}

													$("#bank_code_show").css(
															"display", "none");
													$("#bank_code")
															.css("display",
																	"inline");
												});

								$("#fackfileupbtn").on("click", function() {
									$("#fileinput").click();
								});
								var upload = document
										.getElementById('fileinput'), holder = document
										.getElementById('imgholder');
								$("#fileinput")
										.on(
												"change",
												function(e) {
													e.preventDefault();

													var file = upload.files[0], reader = new FileReader();
													reader.onload = function(
															event) {
														var img = new Image();
														img.src = event.target.result;
														holder.innerHTML = '';
														holder.appendChild(img);
														holder.firstChild.className = "img-responsive img-thumbnail";
													};
													reader.readAsDataURL(file);

													$("#fileflag").val("T");
													return false;
												});

								$("#mem_birth").datepicker({
									dateFormat : 'yy/mm/dd',
									changeMonth : true,
									changeYear : true,
									yearRange : '-100y:c+nn',
									maxDate : '-1d'
								});

							});

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
												+ data.buildingName
												: data.buildingName);
									}
									// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
									fullAddr += (extraAddr !== '' ? ' ('
											+ extraAddr + ')' : '');
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('mem_addr').value = fullAddr;
								document.getElementById('mem_addr_show').value = '('
										+ data.zonecode + ') ' + fullAddr;

								// 커서를 상세주소 필드로 이동한다.
								document.getElementById('mem_addr_detail')
										.focus();
							}
						}).open();
			}
		</script>
</body>

</html>
