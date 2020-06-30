<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY_WRITE</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#upform").submit(function() {
			var ext = $('#upfile').val().split('.').pop().toLowerCase();
			if (ext != null) {
			} else if (ext == 'jpg') {
				return true;
			} else if (ext == 'png') {
				return true;
			} else if (ext == 'gif') {
				return true;
			} else {
				alert('png, jpg, gif 파일만 업로드 해주세요.');
				return false;
			}
			return true;
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
			<p class="cm_subtitle">자유 게시판</p>
			<hr>
			<form action="SKILLSOLOYOLO?command=communityInsert" method="POST" class="container2" enctype="multipart/form-data" id="upform">
				<table class="boardwrite">
					<tr>
						<th>게시판</th>
						<td>
							<select name="divno" class="divboard">
								<option value="1" selected="selected">Culture</option>
								<option value="2">Home Training</option>
								<option value="3">Cooking</option>
								<option value="4">Delivery</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="nickName" value="${ login_Res.nickname }" readonly="readonly"/>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" class="boardwrite_title"></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="upfile" accept="image/png" id="upfile"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" cols="50" rows="10"></textarea></td>
					</tr>
					<tr class="boardwrite_btn">
						<td colspan="2"><input type="submit" value="등록">
						<input type="button" value="취소" onclick="location.href='SKILLSOLOYOLO?command=communityList'"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>