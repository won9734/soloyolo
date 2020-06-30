<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELIVERY_LIST</title>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=ko"></script>
<script> 
function detail( sno, divno ) {
	location.href ="SKILLSOLOYOLO?command=delOne&sno=" + sno + "&divno=" + divno + "&cal=0";
}

function initialize() { 
	<c:forEach  items="${ shopList }" var="shop" begin="0" end="0"> //나중에 반복문 없애고 유저 주소값으로 좌표지정
	
		var myLatlng = new google.maps.LatLng( ${ login_Res.getAddr_X() }, ${ login_Res.getAddr_Y() } ); // 좌표값
	    var mapOptions = { 
	        zoom: 17, // 지도 확대레벨 조정
	        center: myLatlng, 
	        mapTypeId: google.maps.MapTypeId.ROADMAP 
	    } 
	    var map = new google.maps.Map( document.getElementById( 'map_canvas' ), mapOptions ); 
		
		<c:forEach  items="${ shopList }" var="shop" >
			var myLatlng1 = new google.maps.LatLng( ${shop.getShop_X()}, ${shop.getShop_Y()} );
			
			// 마커를 생성합니다
			var marker = new google.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: myLatlng1, // 마커의 위치
				title: "${ shop.getName() }" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
			});
			
			var infowindow = new google.maps.InfoWindow({
				content: '<img style="cursor: pointer" width="200px" height="200px" src ="${ shop.getShopImg() }" onclick="detail( ${ shop.getSno() }, 2 )"><br><div align="center">${ shop.getName() }</div>'// 인포윈도우에 표시할 내용 
			});
			
			google.maps.event.addListener( marker, 'click', makeOverListener( map, marker, infowindow ) );
			
				function makeOverListener( map, marker, infowindow ) {
					return function() {
						infowindow.open( map, marker );
					};
				}
				
				function makeOutListener (infowindow ) {
					return function() {
					infowindow.close();
				};
			}
		</c:forEach>
	</c:forEach>
}

window.onload = initialize;
</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/delivery.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div style="width: 100%; height: 738px;">
			<div class="del_list">
				<c:forEach items="${ shopList }" var="shop">
					<div class="del_detail clearFix">
						<a href="SKILLSOLOYOLO?command=delOne&sno=${ shop.sno }&divno=4&cal=0" class="clearFix">
							<img src="${ shop.shopImg }">
							<p>${ shop.name }</p>
							<p>${ shop.score }</p>
							<%-- <P>${ shop.addr }</P> --%>
							<p>${ shop.ftype }</p>
						</a>
					</div>
				</c:forEach>
			</div>
			<div id="map_canvas">
				
			</div>
		</div>
	</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>