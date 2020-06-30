<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CULTURE_DETAIL</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
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
	var divno = "divno=1";
	var boardno = "boardno=${ mDetail.mno }";
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ mDetail.mname }";
	var favoAddr = "favoAddr=" + encodeURIComponent( 'command=${ command }&mid=${ mDetail.mid }' );
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
					alert( msg.divBoard + "게시판의 " + msg.mno + "번 게시글을 즐겨찾기 하였습니다.\n" + "즐겨찾기 등록 성공 :D" );
					// alert( "즐겨찾기 등록 성공 :D" );
				}, 
				// 서버에 요청을 했지만, 돌아오는 응답이 없으므로 실패
				error : function() {
					alert( "이미 즐겨찾기에 등록된 게시글 입니다." );
				}
			});
		});
	
	// [ 댓글 AJAX ]
	// 데이터 전송
	$( "#click" ).click(function() {
		var command = $( '#command' ).val();
		var userno = $( '#userno' ).val();
		var divno = $( '#divno' ).val();
		var boardno = $( '#boardno' ).val();
		var nickname = $( '#nickname' ).val();
		var content = $( '#content' ).val();
		
		$.ajax({
			url : 'SKILLSOLOYOLO', 
			type : 'POST', //데이터를 서버로 전송하게 된다.
			data : {
				'command' : command, 
				'userno' : userno, 
				'divno' : divno, 
				'boardno' : boardno, 
				'nickname' : nickname, 
				'content' : content
			},
			async: false,
			success : function() {
				alert( "댓글 작성 성공 !!!" );
				location.reload();
			},
			error : function() {
				alert( '댓글 작성 실패 T.T' );
			}
		});
	})
	
	
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
			// alert( msg.divBoard + "게시판의 " + msg.mno + "번 게시글을 히스토리에 등록 하였습니다.\n" );
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
	var divno = "divno=1";
	var mid = 'mid=${ mDetail.mid }';
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ mDetail.mname }";
	var hisAddr = "hisAddr=" + encodeURIComponent( 'command=${ command }&mid=${ mDetail.mid }' );
	return '?' + command + '&' + divno + '&' + mid + '&' + userno + '&' + title + '&' + hisAddr;
}
/*
	JSON : JavaScript Object Notation, 제이슨
	경량 데이터 형식
	{ name:value, name:value, ... }와 같은 형식
*/
</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/culture.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="detailbox">
			<div class="mov_poster">${ mDetail.murl }</div>
			<div class="mov_info">
				<p class="mov_title">${ mDetail.mname }</p>
				<p class="mov_subinfo">
					<span>${ mDetail.release }</span> <span>${ mDetail.nation }</span>
					<span>${ mDetail.mgrade }</span>
				</p>
				<p class="mov_subinfo">
					<span>${ mDetail.genre }</span> <span>상영시간 : ${ mDetail.mtime }</span>
				</p>
				<p class="mov_subinfo">
					<span>감독 : ${ mDetail.director }</span>
					<span>
						<c:if test='${ "" ne mDetail.actor }'>
							출연 : ${ mDetail.actor }
						</c:if>
					</span>
				</p>
				<p class="mov_grade">
					<span class='star-rating'>
						<span style="width:${ mDetail.mscore * 10 }%"></span>
					</span>
					<span class="star_grade">${ mDetail.mscore } / 10</span>
				</p>
			</div>
		</div>

		<div class="container2">
			<p class="mov_subtitle">줄거리</p>
			<hr>
			<p class="mov_story">${ mDetail.mintro }</p>
		</div>

		<div class="container2 favorite" style="margin-top: 40px;">
			<div class="starbox" id="starbox">
				<div class="star"></div>
				<p>즐겨찾기</p>
			</div>
		</div>



		<div class="container2 write">
			<p class="mov_subtitle">한줄 평 쓰기</p>
			<hr>
			<div class="container2 writebox">
				<div id="writeform">
					<input type=hidden id="command" value="insertComment">
					<input type=hidden id="userno" value="${ login_Res.userno }">
					<input type=hidden id="divno" value="1">
					<input type=hidden id="boardno" value="${ mDetail.mno }">
					<input type=hidden id="nickname" value="${ login_Res.nickname }">
					<textarea placeholder="리뷰를 남겨 주세요." id="content"></textarea>
					<input type="button" id="click" class="writebtn" value="등록">
				</div>
			</div>
		</div>

		<div class="container2 write">
			<div class="change">
				<p class="del_subtitle">총 ${ mdcomList.size() } 건</p>
				<hr>
				<ul class="write_list">
					<c:set var="count" value="0" />
					<c:forEach var="i" begin="1" end="5" step="1">
						<li>
							<div class="comment_list">
								<c:forEach var="comment" items="${ mdcomList }" begin="${ count }" end="${ count + 9 }">
									<p class="write_id">${ comment.nickName }</p>
									<p class="write_content">${ comment.content }</p>
									<p class="write_date">${ comment.regdate }</p>
								</c:forEach>
								<c:set var="count" value="${ count + 10 }" />
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="page">
				<ol>
					<!-- <li><a href="#"><img src="/images/page_left.png"></a></li> -->
					<c:forEach var="i" begin="1" end="${ Math.ceil( mdcomList.size() / 10 ) }" step="1">
						<li><a href="#" id="${ i - 1 }" name="button" onclick="page1(this.id);">${ i }</a></li>
					</c:forEach>
					<!-- <li><a href="#"><img src="images/page_right.png"></a></li> -->
				</ol>
			</div>
		</div>
	</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>