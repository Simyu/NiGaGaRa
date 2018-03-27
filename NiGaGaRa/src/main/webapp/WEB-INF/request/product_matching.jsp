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
	<% HttpSession sessions=request.getSession();
	MemberVO user=(MemberVO)session.getAttribute("loginUser");%>
	
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
/* 	function writeToScreen(message)
	{
	     var pre = document.createElement("P");
	     pre.style.wordWrap = "break-word";
	     pre.innerHTML = message;
	     output.appendChild(pre);
	} */

	// 서버에 Message를 전달 합니다.
 	/* function doSend(message)
	{
	    writeToScreen("ENT: " + message); 
		websocket.send(message);
	}  */

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
		 alert("상품매칭"+evt.data);
		 //data = evt.data;
		 var object = JSON.parse(evt.data);
		
		 if (object.pro_type=="result"){
			 var product = '<div style="border: solid">'+'<ul style="width:80%">'+
			    '<li><span>배달상품 이름 : <span><input type="text" disabled="disabled" value="'+object.goods_Name+'"/></li>'+
				'<li><span>무게 : <span><input type="text" disabled="disabled" value="'+object.weight+'"/></li>'+
				'<li><span>수량 : <span><input type="text" disabled="disabled" value="'+object.quantity+'"/></li>'+
				'<li><span>의뢰가격 : <span><input type="text" disabled="disabled" value="'+object.estimated_Price+'"/></li>'+		 
				'<li><span>배달주소 : <span><input type="text" disabled="disabled" value="'+object.receiver_Addr+'"/></li>'+
				'<li><span>배달주소 상세 : <span><input type="text" disabled="disabled" value="'+object.receiver_Addr_detail+'"/></li>'+
				'<li><span>보내는 사람 : <span><input type="text" disabled="disabled" value="'+object.sender_id+'"/></li>'+	
				'<li><span>상품위치 : <span><input type="text" disabled="disabled" value="'+object.sender_Addr+'"/></li>'+
				'<li><span>상품위치 상세 : <span><input type="text" disabled="disabled" value="'+object.sender_Addr_detail+'"/></li>'+
				'<li><span>선호 운송수단 : <span><input type="text" disabled="disabled" value="'+object.delivery_Tool+'"/></li>'+
				'<li><span>배달자 id : <span><input type="text" disabled="disabled" value="'+object.delivery_man+'"/></li>'+
				'</ul>'+
				+'<div>'
				
				document.getElementById("aaaaa").innerHTML=product;
		 }
	}
	
</script>
</head>
<body>
	<input type="button" value="의뢰시작" onclick="sendto()"/>
	<div id= aaaaa></div>

</body>
</html>