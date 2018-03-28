<%@page import="kr.nigagara.teamalpha.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.btn {
	border-radius: 0;
	border: 0;
	border-bottom: 4px solid #CCCCCC;
	margin: 0;
	-webkit-box-shadow: 0 5px 5px -6px rgba(0, 0, 0, .3);
	-moz-box-shadow: 0 5px 5px -6px rgba(0, 0, 0, .3);
	box-shadow: 0 5px 5px -6px rgba(0, 0, 0, .3);
}

.btn .btn-block:active, .btn .btn-lg:active {
	-webkit-box-shadow: inset 0 3px 3px -5px rgba(0, 0, 0, .3);
	-moz-box-shadow: inset 0 3px 3px -5px rgba(0, 0, 0, .3);
	box-shadow: inset 0 3px 3px -5px rgba(0, 0, 0, .3);
}

.btn-magick {
	color: #fff;
	background-color: #bb39d7;
	border-color: #9a00cd;
	text-shadow: 1px 1px 0 #9823d5;
}

.btn-magick:hover, .btn-magick:focus {
	color: #fff;
	background-color: #b13acd;
	border-color: #8600b9;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	<%HttpSession sessions = request.getSession();
			MemberVO user = (MemberVO) session.getAttribute("loginUser");%>
	var locate = new Map();
	var basedata;
	function sendto() {
		
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				/* alert(position.coords.latitude + ' '
						+ position.coords.longitude);//위도 경도 */
				//alert(typeof(position.coords.latitude));
				//alert(position.coords.longitude);
				locate.set("lon", position.coords.longitude);  
				locate.set("lat", position.coords.latitude);  
				
				//alert("lon "+locate.get("lon"));
			
				var data = {
						"pro_type" : "deli_man",
						"id" : "<%=user.getMem_id()%>",
						"lon_delivery" : position.coords.longitude,
						"lat_delivery" : position.coords.latitude
				};
				websocket.send(JSON.stringify(data));
			
				alert("배달시작");
				
			}, function(error) {
				console.error(error);
			}, {
				enableHighAccuracy : false,
				maximumAge : 0,
				timeout : Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
		/* var watchId = navigator.geolocation.watchPosition(function(position) {
			console.log(position.coords);
		}); */
	
		
	}

	function sendAccept(){
		alert("accept")
		var data = basedata;
		data.pro_type = "result";
		data.match_State = "1";
		data.delivery_man = "<%=user.getMem_id()%>";
		alert(JSON.stringify(data));
		
		websocket.send(JSON.stringify(data));
		
		/*				 String pro_goods_Num = (String)object.get("goods_Num");
		 String pro_goods_Name = (String)object.get("goods_Name");
		 String pro_weight = (String)object.get("weight");
		 String pro_quantity = (String)object.get("quantity");
		 String pro_estimated_Price = (String)object.get("estimated_Price");
		 String pro_receiver_Name = (String)object.get("receiver_Name");
		 String pro_receiver_zipcode = (String)object.get("receiver_zipcode");
		 String pro_receiver_Addr = (String)object.get("receiver_Addr");
		 String pro_receiver_Tel = (String)object.get("receiver_Tel");
		 String pro_sender_zipcode = (String)object.get("sender_zipcode");
		 String pro_sender_Addr = (String)object.get("sender_Addr");
		 String pro_delivery_Tool = (String)object.get("delivery_Tool");
		 String pro_goods_Msg = (String)object.get("goods_Msg");
		 String pro_match_State = (String)object.get("match_State");
		 String pro_sender_id = (String)object.get("sender_id");
		 String pro_receiver_Addr_detail = (String)object.get("receiver_Addr_detail");
		 String pro_sender_Addr_detail = (String)object.get("sender_Addr_detail");*/
	
		alert("웹소켓 전송");
	}
	
	var resCnt = 0;     //서버에서 응답받은 횟수.
	var resPositionArr = [];     //서버에서 응답받은 좌표값 Array.
	
	$(document).ready(function()
	{
	     //서버와연결합니다. 웹소켓서버 Uri : ex) `://YourDomain/
	     websocket = new WebSocket("wss://localhost:8443/NiGaGaRa/match");
	     // 서버와연결되면실행됩니다
	     websocket.onopen = function(evt) { onOpen(evt) };
	     // 서버와연결이종료되면실행됩니다
	     websocket.onclose = function(evt) { onClose(evt) };
	     // 서버에서메세지를받으면실행됩니다
	     websocket.onmessage = function(evt) { onMessage(evt) };
	     // 서버연결에서오류가발생하면실행됩니다.
	     websocket.onerror = function(evt) { onError(evt) }; 
	});
	function onOpen(evt)
	{
		alert("연결성공 :~~~~~"+ locate.get("lon"));
	<%-- 	<% MemberVO user = (MemberVO)request.getAttribute("loginUser");%> --%>
	<%-- "id" : '<%=user.getMem_id()%>', --%>
		
	}
	function onClose(evt)
	{
		
	}
	function onError(evt)
	{
	    /*  writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data); */
	}

	// Geolocation API를 사용해 위치 추적을 시작합니다.
	function start()
	{
	     //watchPosition을 사용하여 지속적으로 위치값을 가져옵니다.
	     nav = navigator.geolocation.watchPosition(success, error);
	}
	
	function error(error)
	{
	     alert("Error : " + error.code);
	}
	function end()
	{
	
	}
	
	function onMessage(evt)
	{	
		// alert(evt.data);
		 //data = evt.data;
		 var object = JSON.parse(evt.data);
		 basedata = object;
		 if (object.pro_type=="product"){
			 var product = '<div id = "'+object.goods_Num+'" class="alert alert-success" style="border: solid">'+'<ul style="width:80%">'+
			    '<li><span>배달상품 이름 : <strong>'+object.goods_Name+'</strong></li>'+
				'<li><span>무게 : <strong>'+object.weight+'</strong></li>'+
				'<li><span>수량 : <strong>'+object.quantity+'</strong></li>'+
				'<li><span>의뢰가격 : <strong>'+object.estimated_Price+'원</strong></li>'+		 
				'<li><span>배달주소 : <strong>'+object.receiver_Addr+'</strong></li>'+
				'<li><span>배달주소 상세 : <strong>'+object.receiver_Addr_detail+'</strong></li>'+
				'<li><span>보내는 사람 : <strong>'+object.sender_id+'</strong></li>'+	
				'<li><span>상품위치 : <strong>'+object.sender_Addr+'</strong></li>'+	
				'<li><span>상품위치 상세 : <strong>'+object.sender_Addr_detail+'</strong></li>'+	
				'<li><span>선호 운송수단 : <strong>'+object.delivery_Tool+'</strong></li>'+
				'<input type="button" class="accept" value="수락"/><span>  </span><input type="button" class="refuse" value="거절"/></ul>'+'<div>'
				
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		var product2 ='<div class="panel panel-default" id ="'+object.goods_Num+'">'+
          '<div class="panel-heading">'+
           '<h3 class="panel-title" itemprop="name">'+object.goods_Name+'</h3>'+
          '</div>'+
          '<div class="panel-body" itemprop="reviewBody">'+
          		'<ul>'+
          	   	    '<li><span>배달상품 이름 : <strong>'+object.goods_Name+'</strong></li>'+
					'<li><span>무게 : <strong>'+object.weight+'</strong></li>'+
					'<li><span>수량 : <strong>'+object.quantity+'</strong></li>'+
					'<li><span>의뢰가격 : <strong>'+object.estimated_Price+'원</strong></li>'+		 
					'<li><span>배달주소 : <strong>'+object.receiver_Addr+' '+object.receiver_Addr_detail+'</strong></li>'+
					'<li><span>보내는 사람 : <strong>'+object.sender_id+'</strong></li>'+	
					'<li><span>상품위치 : <strong>'+object.sender_Addr+' '+object.sender_Addr_detail+'</strong></li>'+	
					'<li><span>선호 운송수단 : <strong>'+object.delivery_Tool+'</strong></li>'+
					'<li><span>전달사항 : <strong>'+object.goods_Msg+'</strong></li>'+
				'</ul>'+
				'<div style="float:right;"><input type="button" class="accept btn btn-magick" value="수락"><input type="button" class="refuse btn btn-magick" value="거절"></div>'+
          '</div>'+
          '</div>'

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				$("#aaaaa").append(product2);									
		 }
		 
		 else if(object.pro_type=="result" & object.delivery_man != "<%=user.getMem_id()%>" ){
			
			
				$("#aaaaa").find("#"+object.goods_Num).remove();

		 }
		 
		 else{
			 
		 }
	 
	}
	
	$(document).ready(function(){
		
	
		$(document).on("click",".accept",function(){
			sendAccept();
			alert("배달요청 수락되었습니다.");
			$(this).parent('div').parent('div').parent('div').remove();
			
		});
	
		$(document).on("click",".refuse",function(){
			
			$(this).parent('div').parent('div').parent('div').remove();
			alert("거절하기");
		});
		
		$("#startdeli").click(function(){
			$(this).hide();
		});
	});
	
</script>
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
		<br>
		<br> <input type="button" id="startdeli" class="btn btn-magick"
			value="배달하기" onclick="sendto()" />
		<div id="aaaaa"></div>
	</div>



</body>
</html>