<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		</section>
		<section id="content">
			<div class="col-md-3"></div>
			<div class="col-md-6 panel-body container">
				<div class="row">
					<form action="/NiGaGaRa/delivery.do" method="get" role="form"
						class="contactForm">
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="getter"
								placeholder="보내는사람 " data-rule="minlen:4" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="getter"
								placeholder="물건수거시간" data-rule="minlen:4" />

							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control"
								id="getterPhoneNum" placeholder="물건전달시간" data-rule="minlen:4" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="배송상태" data-rule="minlen:4" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control"
								id="goodsName" placeholder="상품 번호" data-rule="minlen:4" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" name="name" class="form-control" id="quantity"
								placeholder="QR코드" data-rule="minlen:4" />
							<div class="validation"></div>
						</div>
					</form>

				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" name="name" class="form-control" id="getter"
						placeholder="배달기사이름" data-rule="minlen:4" />
						<input type="text" name="name" class="form-control" id="getter"
						placeholder="전화번호" data-rule="minlen:4" />
					<div class="validation"></div>
				</div>
			</div>
		</section>

	</div>
</body>
</html>