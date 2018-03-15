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
	
	var lon = 0;
	var lat = 0;
	function test() {
		
	}
	
	<%-- 	<% MemberVO user = (MemberVO)request.getAttribute("loginUser");%> --%>
	<%-- "id" : '<%=user.getMem_id()%>', --%>
	
	function send() {
		var data = {
				"pro_type" : "deli_man",
				"id" : "this is testid",
				"lon_delivery" : lon,
				"lat_delivery" : lat
		};
		websocket.send(JSON.stringify(data));
	
		alert("웹소켓 전송 "+ lon)
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
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				/* alert(position.coords.latitude + ' '
						+ position.coords.longitude);//위도 경도 */
				alert(typeof(position.coords.latitude));
				alert(position.coords.longitude);
				lon = position.coords.longitude;  
				lat = position.coords.latitude;  
				
				alert("lon : " +lon);
				alert("lat : " +lat);
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
	/* 	var watchId = navigator.geolocation.watchPosition(function(position) {
			console.log(position.coords);
		}); */
		
		alert("연결성공 :~~~~~"+ lon);
		
	
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
	   /*   writeToScreen('<span style="color: blue;">RESPONSE: ' + evt.data + '</span>'); */

	     resCnt++;

	     if(resCnt > 0)
	     {
	          if(resCnt % 2 != 0)
	          {
	               // 웹소켓은 Text형식으로 데이터를 주고 받습니다.
	               resPositionArr.push(evt.data.replace("latitude:", ""));
	               resPositionArr.push(evt.data.replace("longitude:", ""));
	          }
	          else
	          {
	
	        	  //신청 메시지로 배송관련된 데이터를 받고 신청 또는 거절을 한다.
	        	  
	        	  /* 웹소켓은 Text형식으로 데이터를 주고 받습니다.
	               resPositionArr.push(evt.data.replace("longitude:", ""));
	               var resultLat = resPositionArr[resCnt-2];
	               var resultLng = resPositionArr[resCnt-1];
	               var latlng = new google.maps.LatLng(resultLat, resultLng);

	               var marker = new google.maps.Marker({position: latlng, map: Map});

	               Map.setCenter(latlng);
	               Map.setZoom(18); */
	          }
	     }
	}
	
</script>
</head>
<body>
	<input type="button" value ="배달시작" onclick="send()"  />
</body>
</html>