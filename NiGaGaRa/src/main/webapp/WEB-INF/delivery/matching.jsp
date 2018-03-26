<%@page import="kr.nigagara.teamalpha.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				alert(typeof(position.coords.latitude));
				alert(position.coords.longitude);
				locate.set("lon", position.coords.longitude);  
				locate.set("lat", position.coords.latitude);  
				
				alert("lon "+locate.get("lon"));
			
				var data = {
						"pro_type" : "deli_man",
						"id" : "<%=user.getMem_id()%>",
						"lon_delivery" : position.coords.longitude,
						"lat_delivery" : position.coords.latitude
				};
				websocket.send(JSON.stringify(data));
			
				alert("웹소켓 전송");
				
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
	     websocket = new WebSocket("ws://localhost:8088/NiGaGaRa/match");
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
	function success(position)
	{
	   /*   // 성공적으로 위치값을 얻어오면 다시 위치값을 서버로 전송 합니다.
	     // 웹 소켓은 Text형식으로 데이터를 주고 받습니다.
	     doSend("latitude:" + position.coords.latitude);
	     doSend("longitude:" + position.coords.longitude); */
	}
	function error(error)
	{
	     alert("Error : " + error.code);
	}
	function end()
	{
	/* 	websocket.close();     // 웹 소켓 연결을 종료합니다.
	     navigator.geolocation.clearWatch(nav); */
	}
	
	function onMessage(evt)
	{	
		 alert(evt.data);
		 //data = evt.data;
		 var object = JSON.parse(evt.data);
		 basedata = object;
		 if (object.pro_type=="product"){
			 var product = '<div id = "'+object.goods_Num+'" style="border: solid">'+'<ul style="width:80%">'+
			    '<li style="width:50%; float:left"><span>배달상품 이름 : <span><input type="text" disabled="disabled" value="'+object.goods_Name+'"/></li>'+
				'<li style="width:50%; float:left"><span>무게 : <span><input type="text" disabled="disabled" value="'+object.weight+'"/></li>'+
				'<li style="width:50%; float:left"><span>수량 : <span><input type="text" disabled="disabled" value="'+object.quantity+'"/></li>'+
				'<li style="width:50%; float:left"><span>의뢰가격 : <span><input type="text" disabled="disabled" value="'+object.estimated_Price+'"/></li>'+		 
				'<li style="width:50%; float:left"><span>배달주소 : <span><input type="text" disabled="disabled" value="'+object.receiver_Addr+'"/></li>'+
				'<li style="width:50%; float:left"><span>배달주소 상세 : <span><input type="text" disabled="disabled" value="'+object.receiver_Addr_detail+'"/></li>'+
				'<li style="width:50%; float:left"><span>보내는 사람 : <span><input type="text" disabled="disabled" value="'+object.sender_id+'"/></li>'+	
				'<li style="width:50%; float:left"><span>상품위치 : <span><input type="text" disabled="disabled" value="'+object.sender_Addr+'"/></li>'+
				'<li style="width:50%; float:left"><span>상품위치 상세 : <span><input type="text" disabled="disabled" value="'+object.sender_Addr_detail+'"/></li>'+
				'<li style="width:50%; float:left"><span>선호 운송수단 : <span><input type="text" disabled="disabled" value="'+object.delivery_Tool+'"/></li>'+
				'<input type="button" class="accept" value="수락"/><span>  </span><input type="button" class="refuse" value="거절"/></ul>'+'<div>'
				
				
				$("#aaaaa").append(product);	
		 }
		 else if(object.pro_type=="result" & object.delivery_man != "<%=user.getMem_id()%>"){
			
			
				$("#aaaaa").find("#"+object.goods_Num).remove();

			 	
			
		 }
		 
		 else{
			 
		 }
	 
	}
	
	$(document).ready(function(){
		
	
		$(document).on("click",".accept",function(){
			sendAccept();
			alert("결과 전송");
		});
	
		$(document).on("click",".refuse",function(){
			sendresult("refuse");
		});
		
	});
</script>
</head>
<body>
	<input type="button" value="배달하기" onclick="sendto()" />
	<div id="aaaaa"></div>
</body>
</html>