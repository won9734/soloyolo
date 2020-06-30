<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COOK_DETAIL</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	function cal() {
	   location.href='SKILLSOLOYOLO?command=cookOne&cno=${ cookSelOne.cno }&cal=${ cookSelOne.cCal }&userno=${ login_Res.userno }';
	   alert("등록되었습니다.");
	}
</script>
<script type="text/javascript">
function getFavorites() {
/*
	encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, ?, &등을 제외하고 인코딩하는 함수
		↑
		↓
	decodeURI()
	
	encodeURIComponent() : 모든 문자를 인코딩하는 함수
		↑
		↓
	decodeURIComponent()
*/
	var command = "command=getFavo";
	var divno = "divno=3";
	var boardno = "boardno=${ cookSelOne.cno }";
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ cookSelOne.name }";
	var favoAddr = "favoAddr=" + encodeURIComponent( 'command=${ command }&cno=${ cookSelOne.cno }&cal=0' );
	return '?' + command + '&' + divno + '&' + boardno + '&' + userno + '&' + title + '&' + favoAddr;
}
/*
	JSON : JavaScript Object Notation, 제이슨
	경량 데이터 형식
	{ name:value, name:value, ... }와 같은 형식
*/
// [ 즐겨찾기 AJAX ]
$(function() {
	$( "#starbox" ).click(function() {
		$.ajax({
			// calScore라는 SERVLET과 맵핑
				url : "SOLOYOLO" + getFavorites(), 
				type: 'POST', 
				// 서버에서 받을 데이터 형식 지정 → json타입으로 데이터를 받겠다.
				dataType : "Json", 
				async: false, 
				success : function( msg ) {
					// alert( msg );
					// CalScore에서 보내는건 String을 보내지만, 받는 데이터 타입이 json이므로, Object로 형 변환하여 들어온다.
					// CalScore에서 객체로 보내게되면, 객체의 주소를 받게된다. 그러므로 위와같이 보낸다.
					alert( msg.divBoard + "게시판의 " + msg.cno + "번 게시글을 즐겨찾기 하였습니다.\n" + "즐겨찾기 등록 성공 :D" );
					// alert( "즐겨찾기 등록 성공 :D" );
				}, 
				// 서버에 요청을 했지만, 돌아오는 응답이 없으므로 실패
				error : function() {
					alert( "이미 즐겨찾기에 등록된 게시글 입니다.\n" + "즐겨찾기 등록 실패 T.T" );
				}
			});
		});
	// [ 히스토리 AJAX ]
	$.ajax({
	// calScore라는 SERVLET과 맵핑
		url : "SOLOYOLO" + getHistory(), 
		type: 'POST', 
		// 서버에서 받을 데이터 형식 지정 → json타입으로 데이터를 받겠다.
		dataType : "Json", 
		success : function( msg ) {
			// alert( msg );
			// CalScore에서 보내는건 String을 보내지만, 받는 데이터 타입이 json이므로, Object로 형 변환하여 들어온다.
			// CalScore에서 객체로 보내게되면, 객체의 주소를 받게된다. 그러므로 위와같이 보낸다.
			// alert( msg.divBoard + "게시판의 " + msg.cno + "번 게시글을 히스토리에 등록 하였습니다.\n" );
			// alert( "즐겨찾기 등록 성공 :D" );
		}, 
		// 서버에 요청을 했지만, 돌아오는 응답이 없으므로 실패
		error : function() {
			// alert( "히스토리가 업데이트 되었습니다." );
		}
	});
});


function getHistory() {
/*
	encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, ?, &등을 제외하고 인코딩하는 함수
		↑
		↓
	decodeURI()
	
	encodeURIComponent() : 모든 문자를 인코딩하는 함수
		↑
		↓
	decodeURIComponent()
*/
	
	var command = "command=getHis";
	var divno = "divno=3";
	var boardno = "boardno=${ cookSelOne.cno }";
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ cookSelOne.name }";
	var hisAddr = "hisAddr=" + encodeURIComponent( 'command=${ command }&cno=${ cookSelOne.cno }&cal=0' );
	return '?' + command + '&' + divno + '&' + boardno + '&' + userno + '&' + title + '&' + hisAddr;
}
/*
	JSON : JavaScript Object Notation, 제이슨
	경량 데이터 형식
	{ name:value, name:value, ... }와 같은 형식
*/
</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/cooking.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="container2 cook_detail">
			<p>${ cookSelOne.name }</p><button onclick="cal();">칼로리 등록</button><br>
			<%-- <img src="${ cookSelOne.cUrl }"> --%>
			<img style="width: 900px;" src="${ cookSelOne.intro }">
			<%-- <p>${ cookSelOne.intro }</p> --%>
		</div>

		<div class="container2">
			<p class="cook_subtitle">재료</p>
			<hr>
			<div class="cook_material">
				<ul>
					<p>[재료]</p>
					<c:forEach var="matArr" items="${ cMaterial }">
						<li>${ matArr }</li>
					</c:forEach>
				</ul>
				<ul>
					<p>[소스 재료]</p>
					<c:forEach var="seaArr" items="${ cSeasoning }">
						<li>${ seaArr }</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="container2">
			<p class="cook_subtitle">조리 순서</p>
			<hr>

			<c:forEach var="Recipe" items="${ cRecipe }">
				<p class="cook_detail_img detail_first">${ Recipe }</p>
			</c:forEach>
		</div>
		
		<div class="container2 favorite" style="margin-top: 40px;">
			<div class="starbox" id="starbox">
				<div class="star"></div>
				<p>즐겨찾기</p>
			</div>
		</div>
		
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>