<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>

<c:import url="${ url }/common/jsp/external_file.jsp" />


<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}

</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=678ddb5a397da4c0229a40984432993e"></script>



<script type="text/javascript">
var map; //전역변수

$(function(){
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.499294, 127.0331883),
		level: 3 //지도의 확대 라벨
	};
	//지도를 표시할  div와 지도 옵션으로 지도를 생성합니다.
	 map = new kakao.maps.Map(container, options);
}); // ready


function setCenter(lat, lng) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function setMarker(lat,lng){
	setCenter(lat, lng);//지도의 위치를 가운데로 설정
	// 마커가 표시될 위치입니다
	// 위도(lat) : 37.499294
	// 경도(lng) : 127.0331883
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 
	 
	// 마커를 생성합니다 
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});
	 
	var iwContent = `<div style="padding:5px;">안녕하세요<br>
	<a href="#void;" style="color:blue;" target="_blank" /></div>`, 
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
}

$(function(){
	
	lat= 37.499294;
	lng=127.0331883;
	
	$("#btn1").click(function(){
		setMarker(37.498189,127.0315992);
	});
	
	
	$("#btn2").click(function(){
		setMarker(37.5030385,127.0272429);
	});
});


</script>

</head>
<body>
<header data-bs-theme="dark">

<c:import url="${ url }/common/jsp/header.jsp" />

</header>
<main>
<div id="container">
	<div id="map" style="width:600px;height:350px;"></div>
	<input type="button" value="제주은희네" class="btn btn-info" id="btn1"/>
	<input type="button" value="또보겠지강남헬로몽키점" class="btn btn-info" id="btn2"/>

</div>

</main>

<footer class="text-body-secondary py-5">

<c:import url="${ url }/common/jsp/footer.jsp" />

</footer>


</body>
</html>