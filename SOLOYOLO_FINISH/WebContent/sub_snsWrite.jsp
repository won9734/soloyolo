<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS_WRITE</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
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
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
	    <div class="container2">
	        <p class="my_subtitle">개인 SNS</p>
	        <hr>
	        <form action="SKILLSOLOYOLO?command=snsInsert&userno=${ login_Res.userno }&grade=${ login_Res.grade }&nickname=${ login_Res.nickname }" method="POST" class="container2" enctype="multipart/form-data" id="upform">
	            <table class="boardwrite">
	                <tr>
	                    <th>파일</th>
	                    <td><input type="file" name="upfile"></td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td><textarea name="content" cols="50" rows="10"></textarea></td>
	                </tr>
	                <tr class="boardwrite_btn">
	                    <td colspan="2">
	                        <input type="submit" value="등록">
	                        <input type="button" value="취소" onclick="location.href='SOLOYOLO?command=myPage&userno=${ login_Res.userno }&grade=${ login_Res.grade }'">
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>