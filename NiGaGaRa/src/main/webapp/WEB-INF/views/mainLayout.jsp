<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Moderna</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/resources/css/jcarousel.css" rel="stylesheet" />
<link href="/resources/css/flexslider.css" rel="stylesheet" />
<link href="/resources/css/style.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="/resources/skins/default.css" rel="stylesheet" />
</head>
<body>
	<div id="outer">
		<div id="top">
			<tiles:insertAttribute name="top" />
		</div>
		<div class="container">
			<tiles:insertAttribute name="content" />
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.fancybox.pack.js"></script>
	<script src="/resources/js/jquery.fancybox-media.js"></script>
	<script src="/resources/js/google-code-prettify/prettify.js"></script>
	<script src="/resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="/resources/js/portfolio/setting.js"></script>
	<script src="/resources/js/jquery.flexslider.js"></script>
	<script src="/resources/js/animate.js"></script>
	<script src="/resources/js/custom.js"></script>
</body>
</html>