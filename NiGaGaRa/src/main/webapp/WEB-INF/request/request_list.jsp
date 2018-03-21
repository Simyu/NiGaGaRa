<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<li class="active">신청이력</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="col-md-12 panel-body container">
				<div class="row">
					<h4>신청이력</h4>
					<table class="table">
						<thead>
							<tr>
								<th>상품번호(상세)</th>
								<th>상품이름</th>
								<th>무게</th>
								<th>수량</th>
								<th>배송수단</th>
								<th>배송비</th>
								<th>QR코드</th>
								<th>매칭유무</th>
								<th>평가</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="requestlist" items="${requestlist}">
								<tr>
									<th><a
										href="/NiGaGaRa/goods/detail.do?goods_Num=${requestlist.goods_Num}">${requestlist.goods_Num}</a></th>
									<th>${requestlist.goods_Name}</th>
									<th>${requestlist.weight}</th>
									<th>${requestlist.quantity}</th>
									<th>${requestlist.delivery_Tool}</th>
									<th>${requestlist.estimated_Price}</th>
									<th><a href="/NiGaGaRa/goods/qrcode.do?goods_Num=${requestlist.goods_Num}">확인</a></th>
									<th>${requestlist.match_State}</th>
									<c:choose>
									<c:when test="${requestlist.delivery_state==2}">
									<th><a href="/NiGaGaRa/evaluation.do?goods_Num=${requestlist.goods_Num}">평가</a></th>
									</c:when>
									<c:otherwise>
									<th>평가불가</th>
									</c:otherwise>
									</c:choose>
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
