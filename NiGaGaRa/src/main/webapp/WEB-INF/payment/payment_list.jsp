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
							<li><a href="#"> <i class="fa fa-home"></i>
							</a> <i class="icon-angle-right"></i></li>
							<li class="active">거래내역</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
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
	<a href="#" class="scrollup"> <i class="fa fa-angle-up active"></i>
	</a>
</body>
</html>
