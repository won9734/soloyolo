<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY_DETAIL</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function() {
	// [ 댓글 AJAX ]
	// 데이터 전송
	$( "#click" ).click(function() {
		var command = $( '#command' ).val();
		var userno = $( '#userno' ).val();
		var divno = $( '#divno' ).val();
		var nickname = $( '#nickname' ).val();
		var content = $( '#content' ).val();
		
		$.ajax({
			url : 'SKILLSOLOYOLO', 
			type : 'POST', //데이터를 서버로 전송하게 된다.
			data : {
				'command' : command, 
				'userno' : userno, 
				'divno' : divno, 
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
});
</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/community.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="container2 write">
			<p class="cm_subtitle">
				<c:choose>
					<c:when test="${ comSelOne.divno == 1 }">
						Culture
					</c:when>
					<c:when test="${ comSelOne.divno == 2 }">
						Home Trainning
					</c:when>
					<c:when test="${ comSelOne.divno == 3 }">
						Cook
					</c:when>
					<c:when test="${ comSelOne.divno == 4 }">
						Delivery
					</c:when>
					<c:otherwise>
						일치하는 항목이 없습니다.
					</c:otherwise>
				</c:choose>
			</p>
			<hr>
			<div>
				<div class="cm_subtitle2">
					<p>${ comSelOne.title }</p>
				</div>
				<div class="cm_info">
					<span>${ comSelOne.nickName }</span> <span class="date">${ comSelOne.regdate }</span>
				</div>
			</div>
			<div>
				<div class="cm_write">
					<pre>${ comSelOne.content }</pre>
					<div>
						<c:if test="${ comSelOne.fileUrl != null }">
							<img src="images/upLoadFiles/${ comSelOne.fileUrl }" style="width: 200px;">
						</c:if>
					</div>
				</div>
			</div>
			<div class="cm_btn">
				<button onclick="location.href='SKILLSOLOYOLO?command=communityUpdate&comno=${ comSelOne.comno }'">수정</button>
				<button onclick="location.href='SKILLSOLOYOLO?command=communityDelete&comno=${ comSelOne.comno }'">삭제</button>
				<button onclick="location.href='SKILLSOLOYOLO?command=communityList'">목록</button>
			</div>
		</div>

		<div class="container2 favorite" style="margin-top: 40px;">
			<button onclick="location.href='SKILLSOLOYOLO?command=boardRecommend&comno=${ comSelOne.comno }'">
				<div class="heartbox">
					<div class="heart"></div>
					<p>좋아요</p>
				</div>
			</button>
		</div>

		<div class="container2 write">
			<p class="cm_subtitle">댓글 쓰기</p>
			<hr>
			<div class="container2 writebox">
				<input type=hidden id="command" value="insertCComment">
				<input type=hidden id="userno" value="${ login_Res.userno }">
				<c:choose>
					<c:when test="${ comSelOne.divno == 1 }">
						<input type=hidden id="divno" value="1">
					</c:when>
					<c:when test="${ comSelOne.divno == 2 }">
						<input type=hidden id="divno" value="2">
					</c:when>
					<c:when test="${ comSelOne.divno == 3 }">
						<input type=hidden id="divno" value="3">
					</c:when>
					<c:when test="${ comSelOne.divno == 4 }">
						<input type=hidden id="divno" value="4">
					</c:when>
				</c:choose>
				<input type=hidden id="nickname" value="${ login_Res.nickname }">
				<textarea placeholder="리뷰를 남겨 주세요." id="content"></textarea>
				<input type="button" id="click" class="writebtn" value="등록">
			</div>
		</div>

		<div class="container2 write">
			<p class="del_subtitle">총 ${ ccomList.size() } 건</p>
			<hr>
			<ul class="write_list">
				<c:set var="count" value="0" />
				<c:forEach var="i" begin="1" end="5" step="1">
					<li>
						<div class="comment_list">
							<c:forEach var="comment" items="${ ccomList }" begin="${ count }" end="${ count + 9 }">
								<p class="write_id">${ comment.nickName }</p>
								<p class="write_content">${ comment.content }</p>
								<p class="write_date">${ comment.regdate }</p>
							</c:forEach>
							<c:set var="count" value="${ count + 10 }" />
						</div>
					</li>
				</c:forEach>
			</ul>
			
			<div class="page">
				<ol>
					<!-- <li><a href="#"><img src="/images/page_left.png"></a></li> -->
					<c:forEach var="i" begin="1" end="${ Math.ceil( ccomList.size() / 10 ) }" step="1">
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