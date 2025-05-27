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
$(function(){
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3 //지도의 확대 라벨
	};
	//지도를 표시할  div와 지도 옵션으로 지도를 생성합니다.
	var map = new kakao.maps.Map(container, options);
	
}); // ready
</script>

</head>
<body>
<header data-bs-theme="dark">

<c:import url="${ url }/common/jsp/header.jsp" />

</header>
<main>
<div id="container">
	<div id="map" style="width:600px;height:350px;"></div>

</div>

</main>

<footer class="text-body-secondary py-5">

<c:import url="${ url }/common/jsp/footer.jsp" />

</footer>


</body>
</html>