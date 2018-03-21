<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<!--  -->
<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css  -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />


<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
<!------ Include the above in your HEAD tag ---------->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style type="text/css">
.rating {
      float:left;
    }
    .rating:not(:checked) > input {
        position:absolute;
        top:-9999px;
        clip:rect(0,0,0,0);
    }

    .rating:not(:checked) > label {
        float:right;
        width:1em;
        /* padding:0 .1em; */
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:300%;
        /* line-height:1.2; */
        color:#ddd;
    }

    .rating:not(:checked) > label:before {
        content: '★ ';
    }

    .rating > input:checked ~ label {
        color: dodgerblue;
        
    }

    .rating:not(:checked) > label:hover,
    .rating:not(:checked) > label:hover ~ label {
        color: dodgerblue;
        
    }

    .rating > input:checked + label:hover,
    .rating > input:checked + label:hover ~ label,
    .rating > input:checked ~ label:hover,
    .rating > input:checked ~ label:hover ~ label,
    .rating > label:hover ~ input:checked ~ label {
        color: dodgerblue;
        
    }

    .rating > label:active {
        position:relative;
        top:2px;
        left:2px;
    }
</style>
<body>
<div class="container">
    <div class="row">
			<div class="col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img style="height: 200px; width: 170px;" id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                    </div>
                    <form action="/NiGaGaRa/evalInsert.do" method="post" role="form">
                    <div class="col-sm-7 col-md-8">
                    <c:forEach var="evalDetail" items="${evalDetail}">
                        <h4>${evalDetail.mem_name}</h4>
                        <h3>${evalDetail.mem_id }</h3>
                        <small><cite>${evalDetail.mem_addr} <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <h4>
                            <i class="glyphicon glyphicon-envelope"></i>${evalDetail.mem_email}
                            <br />
                            <i class="glyphicon glyphicon-earphone"></i>${evalDetail.mem_phone}
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>${evalDetail.mem_birth}</h4>
                            </c:forEach>
                        <!-- Star -->
                          <div class="rating">
						      <input type="radio" id="star5" name="rating" onclick="myFunction(5)"/><label for="star5" title="평점5개">5 stars</label>
						      <input type="radio" id="star4" name="rating" onclick="myFunction(4)"/><label for="star4" title="평점4개">4 stars</label>
						      <input type="radio" id="star3" name="rating" onclick="myFunction(3)"/><label for="star3" title="평점3개">3 stars</label>
						      <input type="radio" id="star2" name="rating" onclick="myFunction(2)"/><label for="star2" title="평점2개">2 stars</label>
						      <input type="radio" id="star1" name="rating" onclick="myFunction(1)"/><label for="star1" title="평점1개">1 star</label>
						</div>
						<textarea class="form-control" name="grade_content" rows="5" placeholder="평가내용"></textarea>
						<div class="validation"></div>
						<div class="btn-group" style="margin-top: 15px;">
		            	<button type="submit" class="btn btn-primary">평가하기</button></div>             
		            </div>
						<input id="grade" name = "grade"/>
						<input id="goods_Num" name = "goods_Num" value="${goods_Num}"/>
						</form>
                    </div>
           		 </div>
       		 </div>
       		<div class="col-md-3"></div>
		</div>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript">
	function myFunction(star) {
	    document.getElementById("grade").value = star;
	}
	</script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</body>

</html>
