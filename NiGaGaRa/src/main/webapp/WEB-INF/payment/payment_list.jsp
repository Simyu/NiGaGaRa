<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

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
							<li class="active">거래내역</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<h3>
			<i class="fa fa-angle-right"></i> 거래내역
		</h3>
		<section id="content">

			<div class="col-md-12 text-center container">
				<input type="button" id="exchange" class="btn btn-theme"
					value="포인트 환전하기" />
			</div>
			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>포인트 충전 내역</h4>
					<table class="table">
						<thead>
							<tr>
								<th>충전번호</th>
								<th>결제타입</th>
								<th>결제 날짜</th>
								<th>사용금액(-)</th>
								<th>포인트(+)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cash_exchangelist" items="${cash_exchangelist}">
								<tr>
									<td>${cash_exchangelist.exchange_num}</td>
									<td>${cash_exchangelist.exchange_type}</td>
									<td>${cash_exchangelist.exchange_date}</td>
									<td>${cash_exchangelist.cash}</td>
									<td>${cash_exchangelist.point}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>포인트 결제 내역</h4>
					<table class="table">
						<thead>
							<tr>
								<th>결제번호</th>
								<th>배달번호</th>
								<th>날짜</th>
								<th>결제 타입</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="paymentlist" items="${paymentlist}">
								<tr>
									<td>${paymentlist.payment_num}</td>
									<td>${paymentlist.delivery_num}</td>
									<td>${paymentlist.payment_date}</td>
									<td>${paymentlist.payment_type}</td>
									<td>${paymentlist.point}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<div id="exchage-page" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">포인트 환전하기</h4>
				</div>

				<div class="modal-body">

					<form action="/NiGaGaRa/exchange/deposit.do" method="post">
						<input type="hidden" name="id" value="${loginUser.mem_id }"/>

						<input type="text" class="form-control" placeholder="환전할 포인트 입력"
							name="point" id="point" required autofocus>
						<br>
						<input id="exchange_btn" class="btn btn-theme btn-block" type="button" value="환전"/>
						
						<input id="exchange_submit" type="submit" style="display: none;"/>
					</form>

				</div>
				<!-- modal body -->
			</div>
		</div>
	</div>

	<a href="#" class="scrollup">
		<i class="fa fa-angle-up active"></i>
	</a>
	<script type="text/javascript">
	function pad2(n) {
		return n < 10 ? '0' + n : n
	}
		$(document).ready(function() {
			$('#exchange').on("click", function() {
				$("#exchage-page").modal();
			});
			
			$('#exchange_btn').on("click", function() {
				if ($("#point").val()==""){
					alert("포인트를 입력해주세요");
					return;
				}
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
						var date_data = date.getFullYear().toString()
								+ pad2(date.getMonth() + 1)
								+ pad2(date.getDate())
								+ pad2(date.getHours())
								+ pad2(date.getMinutes())
								+ pad2(date.getSeconds());
						var src = {
							    "wd_pass_phrase": "NONE",
							    "wd_print_content": "포인트환전",
							    "tran_dtime": date_data,
							    "req_cnt": "1",
							    "req_list": [
							        {
							            "tran_no": 1,
							            "bank_code_std": '${loginUser.mem_bank_code }',
							            "account_num": '${loginUser.mem_account }',
							            "account_holder_name": '${loginUser.mem_name }',
							            "print_content": "포인트환전",
							            "tran_amt": $("#point").val()
							        }
							    ]
							};
						$.ajax({
							url : 'https://testapi.open-platform.or.kr/transfer/deposit2',
							type : 'post',
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							headers : {
								'Authorization' : ('Bearer ' + data.access_token)
							},
							data : JSON.stringify(src,null, 4)
						}).done(function(data, textStatus,jqXHR) {
								if (isGatewayException(data)) {
									return;
								}
								if (data.rsp_code=="A0000"){
									alert("성공");
									$("#exchange_submit").click();
								}
						});
				
					});
												
				});
			});
		function isGatewayException(data) {
			if (data && data.rsp_code && data.rsp_code.indexOf('A') !== 0 // API업무처리 응답코드를 제외한 응답코드
			) {
				var delim = '___';
				var addMsg = delim;
				// 오류코드 추출 (메인)
				var rsp_code = data.rsp_code;
				//		dc('## rsp_code: '+rsp_code);
				var rsp_code_desc = gwRspCode[rsp_code] ? gwRspCode[rsp_code].rsn
						: '';
				dc('## rsp_code_desc: ' + rsp_code_desc);
				addMsg += '<p>' + rsp_code_desc + '</p>';
				// 오류코드 추출 (세부)
				var rsp_message = data.rsp_message;
				//		dc('## rsp_message: '+rsp_message);
				var rsp_dtl_code, rsp_dtl_code_desc;
				var cdStaIdx = rsp_message.indexOf('([');
				var cdEndIdx = rsp_message.indexOf('])');
				if (cdStaIdx >= 0) {
					rsp_dtl_code = rsp_message
							.substring(cdStaIdx + 2, cdEndIdx);
					rsp_dtl_code_desc = gwRspDtlCode[rsp_dtl_code] ? gwRspDtlCode[rsp_dtl_code].rsn
							: '';
					addMsg += '<p>&nbsp;&nbsp;-&nbsp;' + rsp_dtl_code_desc
							+ '</p>';
					//			dc('## rsp_dtl_code: '+rsp_dtl_code);
					dc('## rsp_dtl_code_desc: ' + rsp_dtl_code_desc);
				}
				showMsg(js(data) + ((addMsg == delim) ? '' : addMsg));
				return true;
			}
			return false;
		}
	</script>
</body>
</html>
