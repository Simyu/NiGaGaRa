<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Moderna - Bootstrap 3 flat corporate template</title>
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
							<li class="active">배달이력</li>
						</ul>
					</div>
				</div>
			</div>
		</section>	
		<br>
			<h3>
			<i class="fa fa-angle-right"></i> 배달이력
		</h3>
		<div class="row mt">

			<div class="col-md-12">
				<div class="content-panel">
					<form class="form-horizontal style-form" method="get"
						action="/NiGaGaRa/delivery/deliverylist.do"></form>
					<table class="table">
						<thead>
							<tr>
								<th>NO</th>
								<th>보내는 분</th>
								<th>배달 기사</th>
								<th>물건 수령 시간</th>
								<th>물건 전달 시간</th>
								<th>이동 수단</th>
								<th>출발지</th>
								<th>도착지</th>
								<th>상품 번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="deliverylist" items="${deliverylist}">
								<tr>
									<th>${deliverylist.delivery_num }</th>
									<th>${deliverylist.sender}</th>
									<th>${deliverylist.delivery_Man}</th>
									<th>${deliverylist.departure_Time}</th>
									<th>${deliverylist.arrival_Time}</th>
									<th>${deliverylist.delivery_Tool}</th>
									<th>${deliverylist.receiver_Addr },${deliverylist.receiver_Addr_detail }</th>
									<th>${deliverylist.sender_Addr },${deliverylist.sender_Addr_detail }</th>
									<th>${deliverylist.goods_Num }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
