<%@page import="kr.nigagara.teamalpha.goods.GoodsVO"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="kr.nigagara.teamalpha.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	
	function sendto() {
		
		var data = {
				"pro_type" : "product",
				"goods_Num" : "${GoodsVO.goods_Num}",
				"goods_Name" : "${GoodsVO.goods_Name}",
				"weight" : "${GoodsVO.weight}",
				 "quantity" : "${GoodsVO.quantity}",
				 "estimated_Price" : "${GoodsVO.estimated_Price}",
				 "receiver_Name" : "${GoodsVO.receiver_Name}",
				 "receiver_zipcode" : "${GoodsVO.receiver_zipcode}",
				 "receiver_Addr" : "${GoodsVO.receiver_Addr}",
				 "receiver_Tel" : "${GoodsVO.receiver_Tel}",
				 "sender_zipcode" : "${GoodsVO.sender_zipcode}",
				 "sender_Addr" : "${GoodsVO.sender_Addr}",
				 "delivery_Tool" : "${GoodsVO.delivery_Tool}",
				 "goods_Msg" : "${GoodsVO.goods_Msg}",
				 "match_State" : "0",
				 "sender_id" : "<%=user.getMem_id()%>",
				 "receiver_Addr_detail" : "${GoodsVO.receiver_Addr_detail}",
				 "sender_Addr_detail" : "${GoodsVO.sender_Addr_detail}",
				 "lat" : "${send_loccode.get(0)}",
				 "lon" : "${send_loccode.get(1)}"
				 } 
				
		websocket.send(JSON.stringify(data));
			
				alert("의뢰시작");
	
				
				
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
		alert("연결성공 :~~~~~");
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
		// alert("상품매칭"+evt.data);
		 //data = evt.data;
		 var object = JSON.parse(evt.data);
		
		 if (object.pro_type=="result" & object.sender_id == "<%=user.getMem_id()%>"){
			 var product = '<div class="alert alert-success" style="border: solid">'+'<ul style="width:80%">'+
			    '<li>배달상품 이름 <strong>'+object.goods_Name+'</strong></li>'+
				'<li>무게 : <strong>'+object.weight+'</strong></li>'+
				'<li>수량 : <strong>'+object.quantity+'</strong></li>'+
				'<li>의뢰가격 : <strong>'+object.estimated_Price+'원</strong></li>'+ 
				'<li>배달주소 : <strong>'+object.receiver_Addr+'</strong></li>'+
				'<li>배달주소 상세 : <strong>'+object.receiver_Addr_detail+'</strong></li>'+
				'<li>보내는 사람 : <strong>'+object.sender_id+'</strong></li>'+
				'<li>상품위치 : <strong>'+object.sender_Addr+'</strong></li>'+
				'<li>상품위치 상세 : <strong>'+object.sender_Addr_detail+'</strong></li>'+
				'<li>선호 운송수단 : <strong>'+object.delivery_Tool+'</strong></li>'+
				'<li>배달자 id : <strong>'+object.delivery_man+'</strong></li>'+
				'</ul>'+
				+'<div>'
				
				document.getElementById("aaaaa").innerHTML=product;
				
				$.ajax({
						url: "/NiGaGaRa/delivery/insert.do",
						type:"post",
						data: evt.data,
						dataType: "json",
						contentType :"application/json;charset=UTF-8",
						success: success_run,
						error: err_run
				});
				
						
				}
		 }
	function success_run(txt){
		alert("db입력완료 : "+txt);
	}
	
	function err_run(obj,msg,statusMsg){
		alert("오류발생 : "+obj+msg+statusMsg);
	}
	
	
	
</script>
</head>
<body>
	<input type="button" value="의뢰시작" onclick="sendto()" />
	<div id=aaaaa></div>
>>>>>>> refs/heads/matching

</body>
</html>