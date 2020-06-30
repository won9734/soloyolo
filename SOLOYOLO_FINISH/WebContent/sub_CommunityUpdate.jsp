<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY_UPDATE</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	 $(function() {
		$( "#upform" ).submit( function() {
			var ext = $('#upfile').val().split('.').pop().toLowerCase();
			
			if( ext != 'png' ) {
				alert('png 파일만 업로드 할수 있습니다.');
				return false;
			}else{
				return true;
			}
		});
	});
</script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/community.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
<section>
    <div class="container2">
        <p class="cm_subtitle">글 수정</p>
        <hr>
        <form action="SKILLSOLOYOLO?command=boardUpdate" method="POST" class="container2" id="upform" enctype="multipart/form-data">
            <input type="hidden" name="comno" value="${ community.comno }">
            <table class="boardwrite">
                <tr>
                    <th>게시판</th>
                    <td>
                    	<input type="hidden" name="divno" value="${ community.divno }"/>
						<c:choose>
							<c:when test="${ community.divno == 1 }">
								Culture
							</c:when>
							<c:when test="${ community.divno == 2 }">
								Home Trainning
							</c:when>
							<c:when test="${ community.divno == 3 }">
								Cook
							</c:when>
							<c:when test="${ community.divno == 4 }">
								Delivery
							</c:when>
							<c:otherwise>
								일치하는 항목이 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="${ community.title }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <th>사진</th>
                    <td><input type="file" name="upfile" accept="image/png" id="upfile"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" cols="50" rows="10">${ community.content }</textarea></td>
                </tr>
                <tr class="boardwrite_btn">
                    <td colspan="2">
                        <input type="submit" value="수정">
                        <input type="button" value="취소" onclick="location.href='tag?command=detail&board_no=${b.board_No}'">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>