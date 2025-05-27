<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /> - 맛집등록</title>
<c:import url="${ url }/common/jsp/external_file.jsp" />
<style type="text/css">
    #container { min-height: 600px; margin-top: 30px; margin-left: 20px; }
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d57108196c618632f26784d2c23d146e"></script>
<script type="text/javascript">
$(function() {
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.499294, 127.0331883),
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
    $("#btnAdd").click(function() {
    	console.log("${ empty userData.id}" );
        <c:choose>
            <c:when test="${ empty userData.id}">
                if( confirm("로그인이 필요합니다. \n로그인 하시겠습니까?") ){
                	location.href="../login/login_frm.jsp";
                }
            </c:when>
            <c:otherwise>
            var restaurant=$("#restaurant").val();
            var menu=$("#menu").val();
            var price=$("#price").val();
            var info=$("#info").val();
            
            if(restaurant.trim()==""){
           	 	alert("식당명은 필수 입력!");
           	 	$("#restaurant").focus();
            	return;
            }//end if
            
            if(menu.trim()==""){
                alert("대표메뉴 필수 입력!");
                $("#menu").focus();
                return;
             }//end if
             
            if(price.trim()==""){
           	 	alert("가격 필수 입력!");
           	 	$("#price").focus();
            	return;
            }//end if
            
            if(info.trim()==""){
                alert("식당설명 필수 입력!");
                $("#info").focus();
                return;
             }//end if
            
                $("#restFrm").submit();
            </c:otherwise>
        </c:choose>
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
<div id="restWrap" style="width: 80%; margin: 0 auto;">
<h3>맛집등록</h3>


<div id="map" style="width:100%; height:550px; border: 1px solid;"></div>

<form action="rest_frm_process.jsp" method="post" name="restFrm" id="restFrm">
<table>
<tbody>
<tr>
    <td colspan="2" style="text-align: center;"></td>
    <h3>맛집입력</h3>
</tr>
<tr>
    <td>식당명</td>
    <td><input type="text" name="restaurant" id="restaurant" style="width:500px"/></td>
</tr>
<tr>
    <td>대표메뉴</td>
    <td><input type="text" name="menu" id="menu" style="width:500px"/></td>
</tr>
<tr>
    <td>메뉴가격</td>
    <td><input type="text" name="price" id="price" style="width:500px"/></td>
</tr>
<tr>
    <td>식당정보</td>
    <td><input type="text" name="info" id="info" style="width:500px"/></td>
</tr>
<tr>
    <td colspan="2" style="text-align: center;">
        <input type="hidden" name="lat" id="lat"/>
        <input type="hidden" name="lng" id="lng"/>
        <input type="button" value="식당정보추가" id="btnAdd" name="btnAdd" class="btn btn-success"/>
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
