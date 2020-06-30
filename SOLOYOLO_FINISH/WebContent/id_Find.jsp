<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID_FIND</title>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="joinbox">
		<div id="logo">
			<img src="images/logo.png">
		</div>
		<form action="SOLOYOLO" method="POST">
			<input type="hidden" name="command" value="idFound" />
			<ul class="info">
				<p>ID 찾기</p>
				<li>
					<input type="text" name="name" placeholder="Name" class="input_style">
				</li>
				<li>
					<select name="phone" class="input_style input_phone">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					 - <input type="tel" name="phone1" class="input_style input_phone" maxlength="4">
					 - <input type="tel" name="phone2" class="input_style input_phone" maxlength="4">
				</li>
			</ul>
			<div class="joinbtnbox">
				<button type="submit" class="joinbtn">ID찾기</button>
				<button type="button" class="joincancelbtn" onclick="location.href='login.jsp'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>