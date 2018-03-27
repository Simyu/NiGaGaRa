<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>카카오페이</title>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<style type='text/css'>
/* <![CDATA[ */
@charset "utf-8";
/* reset */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
	form, fieldset, legend, textarea, p, blockquote, th, td, input, select,
	button {
	margin: 0;
	padding: 0
}

fieldset, img {
	border: 0 none
}

dl, ul, ol, menu, li {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

input, select, textarea, button {
	vertical-align: middle;
	font-size: 100%
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

body {
	-webkit-text-size-adjust: none
}

input:checked[type='checkbox'] {
	background-color: #666;
	-webkit-appearance: checkbox
}

input[type='text'], input[type='password'], input[type='submit'], input[type='search'],
	input[type='tel'], input[type='email'], html input[type='button'],
	input[type='reset'] {
	-webkit-appearance: none;
	border-radius: 0
}

input[type='search']::-webkit-search-cancel-button {
	-webkit-appearance: none
}

body {
	background: #fff
}

body, th, td, input, select, textarea, button {
	font-size: 14px;
	line-height: 1.5;
	font-family: 'Apple SD Gothic Neo', 'Malgun Gothic', '맑은 고딕', sans-serif;
	color: #1e1e1e
}

a {
	color: #333;
	text-decoration: none
}

a:active, a:hover {
	text-decoration: none
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: normal
}

/* global */
#kakaoIndex {
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 0;
	height: 1px;
	margin: 0;
	padding: 0
}

.ir_pm {
	display: block;
	overflow: hidden;
	font-size: 0px;
	line-height: 0;
	text-indent: -9999px
}

.ir_wa {
	display: block;
	overflow: hidden;
	position: relative;
	z-index: -1;
	width: 100%;
	height: 100%
}

.screen_out {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px
}

.show {
	display: block
}

.hide {
	display: none
}

article, aside, footer, header, hgroup, main, nav, section {
	display: block
}

/* Payment Demo */
.wrap_demo {
	min-width: 320px;
	margin: 0 auto 156px;
	text-align: center
}

.wrap_demo .tit_kakaopay {
	display: block;
	width: 67px;
	height: 22px;
	margin: 72px auto 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	background: url(/assets/img/docs/ico_pay_320.png) no-repeat 0 0
}

.wrap_demo .tit_demo {
	margin-top: 21px;
	font-weight: 300;
	font-size: 38px
}

.wrap_demo .txt_demo {
	margin-top: 20px;
	font-size: 15px;
	line-height: 24px
}

.wrap_demo .pay_btn {
	padding-top: 74px
}

.wrap_demo .pay_btn .btn_pay {
	display: block;
	width: 278px;
	height: 63px;
	margin: 10px auto 0;
	border-radius: 63px;
	font-size: 17px;
	color: #fff;
	background-color: #333;
	text-align: center
}

.wrap_demo .pay_btn .btn_pay_hover:hover {
	color: #111;
	background-color: #ffcf22
}

.wrap_demo .txt_append {
	margin-top: 30px;
	line-height: 24px;
	opacity: .5
}

@media only all and (-webkit-min-device-pixel-ratio: 1.5) , only screen and
		(min-device-pixel-ratio: 1.5) , only screen and (min-resolution:
	1.5dppx) {
	.wrap_demo .tit_kakaopay {
		background-image: url(/assets/img/docs/ico_pay_640.png);
		background-size: 67px 22px
	}
}
/* ]]> */
</style>
<div id="kakaoIndex">
	<a href="#kakaoBody"> 본문 바로가기 </a>
</div>
<div id="kakaoWrap" class="wrap_demo">
	<header id="kakaoHead">
		<h1 class="tit_kakaopay">카카오페이</h1>
		<hr class="hide" />
		<main id="kakaoContent">
		<article id="mArticle">
			<h2 id="kakaoBody" class="tit_demo">포인트 전환</h2>
			<p class="txt_demo">
				포인트를 결제하여 배송비로 사용하세요
				<br />
				(결제는 1000원 이상만 가능합니다)
			</p>
			<div class="pay_btn">
				<form action="/NiGaGaRa/payment_forth.do" method="post" role="form"
					class="contactForm">
					<input type="hidden" name="mem_id" value="${loginUser.mem_id }">
					<input type="text" class="btn_pay btn_pay_hover"
						placeholder="전환할 금액입력" name="cash" />
					<button type="submit" class="btn_pay btn_pay_hover">결제</button>
				</form>
			</div>
			<p class="txt_append">배송을 위한 포인트를 결제하세요.</p>
		</article>
		</main>
	</header>
</div>
<script type='text/javascript'>
	//<![CDATA[
	$(document)
			.ready(
					function() {
						if (!/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
								.test(navigator.userAgent)) {
							$('#mobile').attr('disabled', 'disabled');
							$('#mobile').removeClass('btn_pay_hover');
							$('#mobile').css('cursor', 'no-drop');
						}
					});
	//]]>
</script>

</html>
