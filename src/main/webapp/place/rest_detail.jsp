<%@page import="kr.co.sist.place.RestDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>
<%
String paramRestNum=request.getParameter("num");
int num=0;
try{
	num=Integer.parseInt(paramRestNum);
}catch(NumberFormatException nfe){
	
}
PlaceService ps=new PlaceService();
RestDTO rDTO = ps.searchOneRestaurant(num);
pageContext.setAttribute("rDTO",rDTO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" />-맛집상세정보</title>
<c:import url="${ url }/common/jsp/external_file.jsp" />
<style type="text/css">
    #container { min-height: 600px; margin-top: 30px; margin-left: 20px; }
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d57108196c618632f26784d2c23d146e"></script>
<script type="text/javascript">
$(function() {
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(${rDTO.lat}, ${rDTO.lng}),
            level: 3
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var marker = new kakao.maps.Marker({
        position: map.getCenter()
    });
    marker.setMap(map);

    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        var latlng = mouseEvent.latLng;
        marker.setPosition(latlng);

        $("#lat").val(latlng.getLat());
        $("#lng").val(latlng.getLng());
    });
});
</script>

<script type="text/javascript">
$(function() {
});
</script>

</head>
<body>
<header data-bs-theme="dark">
    <c:import url="${ url }/common/jsp/header.jsp" />
</header>

<main>
<div id="container">
<div id="restWrap" style="width: 80%; margin: 0 auto;">
<h3>맛집보기</h3>


<div id="map" style="width:100%; height:550px; border: 1px solid;"></div>

<table>
<tbody>
<tr>
    <td colspan="2" style="text-align: center;"></td>
    <h3>맛집정보</h3>
</tr>
<tr>
    <td>식당명</td>
    <td><strong><c:out value="${rDTO.restaurant }"/></strong></td>
</tr>
<tr>
    <td>대표메뉴</td>
    <td><strong><c:out value="${rDTO.menu }"/></strong></td>
</tr>
<tr>
    <td>메뉴가격</td>
    <td><strong><fmt:formatNumber value="${rDTO.price }" pattern="#,###"/>원</strong></td>
</tr>
<tr>
    <td>식당정보</td>
    <td><strong><c:out value="${rDTO.info }"/></strong></td>
</tr>
<tr>
    <td>작성자</td>
    <td><strong><c:out value="${rDTO.id }"/></strong></td>
</tr>
<tr>
    <td>작성일</td>
    <td><strong><fmt:formatDate value="${rDTO.input_date }" pattern="yyyy-MM-dd EEEE HH:MM"/></strong></td>
</tr>
<tr>
    <td colspan="2" style="text-align: center;">
        <a href="restaurant_list.jsp" class="btn btn-info">맛집리스트</a>
    </td>
</tr>
</tbody>
</table>
</form>

</div>
</div>
</main>

<footer class="text-body-secondary py-5">
    <c:import url="${ url }/common/jsp/footer.jsp" />
</footer>

</body>
</html>
