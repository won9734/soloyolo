<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER_LIST</title>

<link rel="stylesheet" href="css/common.css">
</head>
<body>
	<%@ include file="./form/header.jsp"%>
	<section>
		<h1 style="text-align: center; margin: 60px 0px 30px 0px">Member List</h1>
		<table border="1" style="margin: 0 auto; margin-bottom: 60px;">
			<tr>
				<th>USERNO</th>
				<th>USERID</th>
				<th>USERPW</th>
				<th>NAME</th>
				<th>NICKNAME</th>
				<th>EMAIL</th>
				<th>PHONE</th>
				<th>HEIGHT</th>
				<th>WEIGHT</th>
				<th>ADDRESS</th>
				<th>GRADE</th>
				<th>FAVORITE_GENRE</th>
				<th>FAVORITE_HT</th>
				<th>SUBDATE</th>
				<th>DELETE</th>
			</tr>
			<c:choose>
				<c:when test="${ empty memberList }">
					<tr>
						<td colspan="15" align="center">---- 회원 정보가 존재하지 않습니다. ----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="list" items="${ memberList }">
						<tr align="center">
							<td>${ list.userno }</td>
							<td>${ list.userid }</td>
							<td>${ list.userpw }</td>
							<td>${ list.name }</td>
							<td>${ list.nickname }</td>
							<td>${ list.email }</td>
							<td>${ list.phone }</td>
							<td>${ list.height }</td>
							<td>${ list.weight }</td>
							<td>${ list.addr },${ list.addr_Detail }</td>
							<td>${ list.grade }</td>
							<td>${ list.favogenre }</td>
							<td>${ list.favoht }</td>
							<td>${ list.subdate }</td>
							<td>
								<input type="button" value="DELETE" onclick="location.href='SOLOYOLO?command=adminDelete&userno=${ list.userno }&grade=${ list.grade }'"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="15" align="right"><input type="button" value="GO TO MAIN" onclick="location.href='main.jsp'" /></td>
			</tr>
		</table>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>