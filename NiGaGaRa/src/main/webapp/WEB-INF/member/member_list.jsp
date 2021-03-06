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

<title>DASHGUM - Bootstrap Admin Template</title>
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
							<li class="active">마이페이지</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<h3>
			<i class="fa fa-angle-right"></i> 회원관리
		</h3>
		<div class="row mt">

			<div class="col-md-12">
				<div class="content-panel">
					<form class="form-horizontal style-form" method="get"
						action="/NiGaGaRa/member/list.do"></form>
					<table class="table table-striped table-advance table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Gender</th>
								<th>Tel</th>
								<th>Rating</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${memberlist }">
								<tr>
									<td><a
										href="/NiGaGaRa/member/profile.do?mem_id=${list.mem_id }">${list.mem_id }</a>
									</td>
									<td>${list.mem_name }</td>
									<td>${list.mem_gender}</td>
									<td>${list.mem_phone }</td>
									<td>
									<c:choose>
									<c:when test="${list.role == 'ROLE_USER' }">
										<a class="btn btn-primary btn-xs" href="/NiGaGaRa/member/updaterole.do?id=${list.mem_id }&role=ROLE_ADMIN">관리자</a>
										</c:when>

									<c:when test="${list.role == 'ROLE_ADMIN' }">
										<a class="btn btn-primary btn-xs" href="/NiGaGaRa/member/updaterole.do?id=${list.mem_id }&role=ROLE_USER">일반회원</a>
										</c:when>
										</c:choose>
									</td>
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
