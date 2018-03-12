<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">


<title>배달 조회</title>
<style type="text/css">
th {
	color: silver;
}

td {
	color: black;
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
							<li><a href="#"><i class="fa fa-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li class="active">마이페이지</li>
						</ul>
					</div>
				</div>
			</div>
			<section id="content">
				<div class="col-md-12">
					<div class="content-panel">
						<form class="form-horizontal style-form"
							action="/NiGaGaRa/delivery.do" method="get" name="formlist"
							role="form">
							<table class="table table-striped table-advance table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>보낸사람</th>
										<th>받는사람</th>
										<th>물품명</th>
										<th>물건수령시간</th>
										<th>물건전달시간</th>
										<th>상품번호</th>
									</tr>
								</thead>
								<c:forEach var="deliver" items="${deliverylist} }">
									<tbody>
										<tr>
											<%-- <td>${deliver.delivery_num }</td>
											<td>${deliver.sender }</td>
											<td>${deliver.receiver_Name}</td>
											<td>${deliver.goods_Name }</td>
											<td>${deliver.departure_Time }</td>
											<td>${deliver.arrival_Time }</td>
											<td>${deliver.goods_num }</td> --%>
											<td>1</td>
											<td>김진우</td>
											<td>김진우</td>
											<td>막창</td>
											<td>08:00</td>
											<td>10:00</td>
											<td>000000</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</form>
						<br /> <br /> <br /> <br /> <br /> <br />
					</div>
				</div>
			</section>
		</section>
	</div>
</body>
</html>
