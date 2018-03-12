<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTFr-8"
	session="true" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<!-- 이수진이 만들었음 필요 없을지도 -->
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
							<li class="active">마이페이지 </li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>충전내역</h4>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>날짜</th>
								<th>비고</th>
								<th>금액</th>
								<th>남은 포인트</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>****</td>
								<td>$"{PaymentVo.payment_date}"</td>
								<td>$"{PaymentVo.payment_type}"</td>
								<td>$"{PaymentVo.point}"원</td>
								<td>$"{PaymentVo.point}"원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-md-6 panel-body container">
				<div class="row">
					<h4>거래내역</h4>
					<table class="table">
						<thead>
							<tr>
								<th>거래번호</th>
								<th>날짜</th>
								<th>배달번호</th>
								<th>지출 포인트</th>
								<th>수입 포인트</th>
								<th>남은 포인트</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>$"{PaymentVo.payment_num}"</td>
								<td>$"{PaymentVo.payment_date}"</td>
								<td>$"{DeliverVO.delivery_num}</td>
								<td>$"{PaymentVo.point}"</td>
								<td>$"{PaymentVo.point}"</td>
								<td>$"{PaymentVo.point}"</td>
							</tr>
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
