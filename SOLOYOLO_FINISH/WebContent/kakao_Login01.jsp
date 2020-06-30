<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ page import="com.soloyolo.model.dao.SNSLogin" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS_LOGIN_KAKAO</title>
</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
	Kakao.init( '76c0dbd7d9068bde24079e3cd4f90525' );
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function( authObj ) {
			location.href = "kakao_Login02.jsp?token=" + authObj.access_token;
		}, fail : function( err ) {
			alert( JSON.stringify( err ) );
		}
	});
</script>
</body>
</html>