<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">


<title>배달 조회</title>
<style type="text/css">
	th{color:silver;}
	td{color:black;}
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
							<li class="active">배달조회</li>
						</ul>
					</div>
				</div>
			</div>
			<section id="content">
				<div class="col-md-12">
					<div class="content-panel">
						<form class="form-horizontal style-form" method="get"
							name="formlist">
						</form>
						<table class="table table-striped table-advance table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th>발신인</th>
									<th>배달기사</th>
									<th>상품번호</th>
									<th>QR코드</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>김진우</td>
									<td>김진우</td>
									<td>0000000000</td>
									<td><button value="QR버튼확인">버튼</button></td>
								</tr>
							</tbody>
						</table>
						<br /> <br /> <br /> <br /> <br /> <br />
					</div>
				</div>
			</section>
		</section>
	</div>
</body>
</html>
