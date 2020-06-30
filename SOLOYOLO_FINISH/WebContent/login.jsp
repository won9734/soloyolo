<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ page import="com.soloyolo.model.dao.SNSLogin" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/snslogin.css">

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	var googleUser = {};
	var startApp = function() {
		gapi.load( 'auth2', function() {
			// Retrieve the singleton for the GoogleAuth library and set up the client.
			auth2 = gapi.auth2.init({
				client_id : '261155945457-hldrqj0hooe38rjjkjd0csa7amisdv2q.apps.googleusercontent.com',
				cookiepolicy : 'single_host_origin',
				// Request scopes in addition to 'profile' and 'email'
				//scope: 'additional_scope'
			});
			attachSignin( document.getElementById( 'customBtn' ) );
		});
	};

	function attachSignin(element) {
		console.log( element.id );
		auth2.attachClickHandler(element, {}, function( googleUser ) {
			googleUser.getBasicProfile().getName();
			var id = googleUser.getBasicProfile().getId()
			location.href = "SOLOYOLO?command=success_api&userid=" + id;
		}, function( error ) {
			alert( JSON.stringify( error, undefined, 2 ) );
		});
	}
</script>
</head>
<body>
	<div class="loginbox">
		<div id="logo">
			<img src="images/logo.png">
		</div>
		<form action="SOLOYOLO" method="POST">
			<input type="hidden" name="command" value="success" />
			<ul class="idpw">
				<li><input type="text" name="userid" id="userid" class="input_style" placeholder="Id"></li>
				<li><input type="password" name="userpw" id="userpw" class="input_style" placeholder="Password"></li>
			</ul>
			<button class="loginbtn" type="submit">Login</button>
			<div>
				<button class="subbtn" type="button"
					onclick="location.href='SOLOYOLO?command=idFind'">ID찾기</button>
				<button class="subbtn" type="button"
					onclick="location.href='SOLOYOLO?command=pwFind'">PW찾기</button>
				<button class="subbtn" type="button"
					onclick="location.href='SOLOYOLO?command=regist'">회원가입</button>
			</div>
		</form>

		<!-- 버튼생성 위치 div태그 -->
		<div class="sns">

			<!-- 카카오 로그인 버튼 -->
			<a id="kakao-login-btn"></a>
			<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
	Kakao.init('76c0dbd7d9068bde24079e3cd4f90525');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function( authObj ) {
			alert( JSON.stringify( authObj ) );
			document.write(authObj.access_token + "<br>");

			location.href = "kakao_Login02.jsp?token=" + authObj.access_token;
		},
		fail : function( err ) {
			alert( JSON.stringify( err ) );

		}
	});
</script>

			<!-- 구글 로그인 버튼 -->
			<div id="gSignInWrapper" class="customGPlusSignIn">
				<!--  <div  > -->
				<img src="images/sns_google.png" id="customBtn">
			</div>
		</div>

		<script>
			startApp();
		</script>
	</div>

	<!-- <div class="sns">
			<a href="#">
				<img src="images/sns_google.png">
			</a>
			<a href="#">
				<img src="images/sns_kakao.png">
			</a>
			<a href="#">
				<img src="images/sns_naver.png">
			</a>
		</div> -->
	</div>
</body>
</html>