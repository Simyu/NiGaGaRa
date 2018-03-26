<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty loginUser}">
		<h1>${loginUser.mem_name }님환영합니다</h1>
	</c:if>
	<input type="hidden" name ="login_id" value="${loginUser.mem_id }">
	<div id="wrapper">
		<section id="featured">
			<!-- start slider -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Slider -->
						<div id="main-slider" class="flexslider">
							<ul class="slides">
								<li>

									<img src="/NiGaGaRa/resources/img/slides/1.jpg"  alt="" />
									<div class="flex-caption">									
										<h3>니가가라</h3>
										<p>nigagara. 현재 바로 택배를 보내고 싶을때, 보다 저렴한 택배 이용이 필요할때
										가벼운 금전 수확이 가능한 Geek 택배대행 서비스업체입니다.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div>
								</li>
								<li>
									<img src="/NiGaGaRa/resources/img/slides/2.jpg"  alt="" />
									<div class="flex-caption">
										<h3>상품등록부터 매칭까지</h3>
										<p>상품등록을 하면 자동으로 매칭 됩니다. 매칭이 안됬다구요?
										실망하지 마세요! 다른 기사분들이 맡을수도 있고 다시 매칭 또한 가능하답니다.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div>
								</li>
								<li>
									<img src="/NiGaGaRa/resources/img/slides/12.jpg"  alt="" />
									<div class="flex-caption">
										<h3>평가해주세요</h3>
										<p>배송이 완료 됬다면 평가를 통해 기사님들을 평가하실 수 있어요.
										상품 상태가 엉망이라면 낮은 별점을 주시면 됩니다.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div>
								</li>
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>



		</section>
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2>
									<span>NIGAGARA</span>
									택배 대행 서비스
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>상품등록</h4>
										<div class="icon">
											<i class="fa fa-desktop fa-3x"></i>
										</div>
										<p>상품등록부터 매칭까지 원클릭 서비스</p>

									</div>
									<div class="box-bottom">
										<a href="/NiGaGaRa/request.do">Learn more</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>물품조회</h4>
										<div class="icon">
											<i class="fas fa-search fa-3x"></i>
										</div>
										<p>현재 매칭이 안된 물품을 볼 수 있습니다. 매칭하여 포인트를 챙기세요!</p>

									</div>
									<div class="box-bottom">
										<a href="/NiGaGaRa/goods/list.do">Learn more</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>QR 리더기</h4>
										<div class="icon">
											<i class="fas fa-qrcode fa-3x"></i>
										</div>
										<p>배송출발,도착시 꼭 QR을 찍어야 배송처리가 완료된답니다!</p>

									</div>
									<div class="box-bottom">
										<a href="/NiGaGaRa/delivery/qrread.do">Learn more</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>가입하기</h4>
										<div class="icon">
											<i class="far fa-hand-point-up fa-3x"></i>
										</div>
										<p>물론 이모든 서비스를 이용하기 위해선 가입이 먼저!</p>

									</div>
									<div class="box-bottom">
										<a href="/NiGaGaRa/member/register.do">Learn more</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Portfolio Projects -->
<!-- 				<div class="row">
					<div class="col-lg-12">
						<h4 class="heading">Recent Works</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									Item Project and Filter Name
									<li class="col-lg-3 design" data-id="id-0" data-type="web">
										<div class="item-thumbs">
											Fancybox - Gallery Enabled - Title - Full Image
											<a class="hover-wrap fancybox" data-fancybox-group="gallery"
												title="Work 1" href="/NiGaGaRa/resources/img/works/1.jpg">
												<span class="overlay-img"></span>
												<span class="overlay-img-thumb font-icon-plus"></span>
											</a>
											Thumb Image and Description
											<img src="/NiGaGaRa/resources/img/works/1.jpg"
												alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
										</div>
									</li>
									End Item Project
									Item Project and Filter Name
									<li class="item-thumbs col-lg-3 design" data-id="id-1"
										data-type="icon">
										Fancybox - Gallery Enabled - Title - Full Image
										<a class="hover-wrap fancybox" data-fancybox-group="gallery"
											title="Work 2" href="/NiGaGaRa/resources/img/works/2.jpg">
											<span class="overlay-img"></span>
											<span class="overlay-img-thumb font-icon-plus"></span>
										</a>
										Thumb Image and Description
										<img src="/NiGaGaRa/resources/img/works/2.jpg"
											alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									End Item Project
									Item Project and Filter Name
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										Fancybox - Gallery Enabled - Title - Full Image
										<a class="hover-wrap fancybox" data-fancybox-group="gallery"
											title="Work 3" href="/NiGaGaRa/resources/img/works/3.jpg">
											<span class="overlay-img"></span>
											<span class="overlay-img-thumb font-icon-plus"></span>
										</a>
										Thumb Image and Description
										<img src="/NiGaGaRa/resources/img/works/3.jpg"
											alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									End Item Project
									Item Project and Filter Name
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										Fancybox - Gallery Enabled - Title - Full Image
										<a class="hover-wrap fancybox" data-fancybox-group="gallery"
											title="Work 4" href="/NiGaGaRa/resources/img/works/4.jpg">
											<span class="overlay-img"></span>
											<span class="overlay-img-thumb font-icon-plus"></span>
										</a>
										Thumb Image and Description
										<img src="/NiGaGaRa/resources/img/works/4.jpg"
											alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									End Item Project
								</ul>
							</section>
						</div>
					</div>
				</div>

			 --></div>
		</section>
	</div>
</body>
</html>