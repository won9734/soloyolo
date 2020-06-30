<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ page import="com.soloyolo.model.dao.SNSLogin"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS_LOGIN_KAKAO</title>
</head>
<body>
<%	
	System.out.println( "SNS_LOGIN - KAKAO 들어옴" );

	String token = request.getParameter( "token" );
	SNSLogin gui = new SNSLogin();
	Long id = gui.getUserInfo( token );
	System.out.println( id );
	
	response.sendRedirect( "SOLOYOLO?command=success_api&userid=" + id );
%>	
</body>
</html>