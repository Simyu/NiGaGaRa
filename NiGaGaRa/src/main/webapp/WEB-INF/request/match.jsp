<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<%
	List<Double> send_loccode = (List<Double>) request.getAttribute("send_loccode");
	List<Double> receive_loccode = (List<Double>) request.getAttribute("receive_loccode");
%>

<script
	src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=7d6bb7b7-15c4-4781-8cc6-671ae6b0f25d"></script>

<script type="text/javascript">
        // map 생성
        // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.		
        function initTmap(){
        map = new Tmap.Map({
        	div : 'map_div', // map을 표시해줄 div
        	width : "100%", // map의 width 설정
        	height : "380px", // map의 height 설정
        });
        map.setCenter(new Tmap.LonLat("126.9850380932383", "37.566567545861645").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
        var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
        var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
        map.addLayer(routeLayer);//map에 벡터 레이어 추가
        map.addLayer(markerLayer);//map에 마커 레이어 추가
        // 시작
        var size = new Tmap.Size(24, 38);//아이콘 크기 설정
        var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
        var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
        var marker_s = new Tmap.Marker(new Tmap.LonLat("<%=send_loccode.get(1)%>", "<%=send_loccode.get(0)%>").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
        markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가

        // 도착
        var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);//마커 아이콘 설정
        var marker_e = new Tmap.Marker(new Tmap.LonLat("<%=receive_loccode.get(1)%>", "<%=receive_loccode.get(0)%>").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
        markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가
        var headers = {}; 
        headers["appKey"]="7d6bb7b7-15c4-4781-8cc6-671ae6b0f25d";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
        $.ajax({
        	method:"POST",
        	headers : headers,
        	url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//자동차 경로안내 api 요청 url입니다.
        	async:false,
        	data:{
        		//출발지 위경도 좌표입니다.
        		startX : "<%=send_loccode.get(1)%>",
        		startY : "<%=send_loccode.get(0)%>",
        		//목적지 위경도 좌표입니다.
        		endX : "<%=receive_loccode.get(1)%>",
        		endY : "<%=receive_loccode.get(0)%>",
						//출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
						reqCoordType : "WGS84GEO",
						resCoordType : "EPSG3857",
						//각도입니다.
						angle : "172",
						//경로 탐색 옵션 입니다.
						searchOption : 10
					},
					//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
					success : function(response) {
						prtcl = response;

						// 결과 출력
						var innerHtml = "";
						var prtclString = new XMLSerializer()
								.serializeToString(prtcl);//xml to String	
						xmlDoc = $.parseXML(prtclString), $xml = $(xmlDoc),
								$intRate = $xml.find("Document");

						var tDistance = "총 거리 : "
								+ ($intRate[0]
										.getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000)
										.toFixed(1) + "km,";
						var tTime = " 총 시간 : "
								+ ($intRate[0]
										.getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60)
										.toFixed(0) + "분,";
						var taxiFare = " 예상 택시 요금 : "
								+ $intRate[0]
										.getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue
								+ "원";

						$("#result").text(tDistance + tTime + taxiFare);

						prtcl = new Tmap.Format.KML({
							extractStyles : true,
							extractAttributes : true
						}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.

						routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.

						//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
						//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
						routeLayer.events.register("beforefeatureadded",
								routeLayer, onBeforeFeatureAdded);
						function onBeforeFeatureAdded(e) {
							var style = {};
							switch (e.feature.attributes.styleUrl) {
							case "#pointStyle":
								style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
								style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
								style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
								style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
								break;
							default:
								style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
								style.strokeOpacity = "1";//stroke의 투명도(0~1)
								style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
							}
							;
							e.feature.style = style;
						}

						routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.

						map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
					},
					//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});
	}
</script>
</head>
<body onload="initTmap()">
	<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li>
							<a href="#">
								<i class="fa fa-home"></i>
							</a>
							<i class="icon-angle-right"></i>
						</li>
						<li class="active">경로확인</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<form action="/NiGaGaRa/goods/match.do" method="post" role="form"
		class="contactForm">
		<div class="form-group">
			<h4>출발지 :</h4>
			<input type="text" name="name" class="form-control" id="start"
				value="${GoodsVO.sender_Addr} ${GoodsVO.sender_Addr_detail}"
				readonly />
			<div class="validation"></div>
			<div class="form-group">
				<h4>도착지 :</h4>
				<input type="text" name="name" class="form-control" id="end"
					value="${GoodsVO.receiver_Addr} ${GoodsVO.receiver_Addr_detail}"
					readonly />
				<div class="validation"></div>
			</div>
		</div>
		<div id="map_div"></div>
		<h4 id="result"></h4>
		<div class="text-center">
			<button type="submit" class="btn btn-theme">매칭시작</button>
		</div>
		<input type="hidden" name = "goods_Num" value="${GoodsVO.goods_Num}"/>	
		<input type="hidden" name = "goods_Name"  value="${GoodsVO.goods_Name}"/>
		<input type="hidden" name = "weight"  value="${GoodsVO.weight}"/>
		<input type="hidden" name = "quantity"  value="${GoodsVO.quantity}"/>
		<input type="hidden" name = "estimated_Price"  value="${GoodsVO.estimated_Price}"/>
		<input type="hidden" name = "receiver_Name"  value="${GoodsVO.receiver_Name}"/>
		<input type="hidden" name = "receiver_zipcode"  value="${GoodsVO.receiver_zipcode}"/>
		<input type="hidden" name = "receiver_Addr"  value="${GoodsVO.receiver_Addr}"/>
		<input type="hidden" name = "receiver_Tel"  value="${GoodsVO.receiver_Tel}"/>
		<input type="hidden" name = "sender_zipcode"  value="${GoodsVO.sender_zipcode}"/>
		<input type="hidden" name = "sender_Addr"  value="${GoodsVO.sender_Addr}"/>
		<input type="hidden" name = "delivery_Tool"  value="${GoodsVO.delivery_Tool}"/>
		<input type="hidden" name = "goods_Msg"  value="${GoodsVO.goods_Msg}"/>
		<input type="hidden" name = "match_State"  value="${GoodsVO.match_State}"/>
		<input type="hidden" name = "mem_id"  value="${loginUser.mem_id}"/>
		<input type="hidden" name = "receiver_Addr_detail"  value="${GoodsVO.receiver_Addr_detail}"/>
		<input type="hidden" name = "sender_Addr_detail"  value="${GoodsVO.sender_Addr_detail}"/>
	</form>
</body>
</html>