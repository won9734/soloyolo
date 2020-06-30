<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/common.css">
<title>MAIN</title>
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div id="menu">
			<ul>
				<li>
					<a href="SOLOYOLO?command=mList&grade=${ login_Res.grade }"><img src="images/main_movie.png"></a>
					<span>Culture</span>
					<div class="line"></div>
					<a href="SOLOYOLO?command=mList&grade=${ login_Res.grade }"><div class="more">More</div></a>
				</li>
				<li>
					<a href="SKILLSOLOYOLO?command=htList"><img src="images/main_ht.png"></a>
					<span>Home Training</span>
					<div class="line"></div>
					<a href="SKILLSOLOYOLO?command=htList"><div class="more">More</div></a>
				</li>
				<li>
					<a href="SKILLSOLOYOLO?command=cookList"><img src="images/main_cook.png"></a>
					<span>Cooking</span>
					<div class="line"></div>
					<a href="SKILLSOLOYOLO?command=cookList"><div class="more">More</div></a>
				</li>
				<li>
					<a href="SKILLSOLOYOLO?command=deliveryList"><img src="images/main_delivery.png"></a>
					<span>Delivery</span>
					<div class="line"></div>
					<a href="SKILLSOLOYOLO?command=deliveryList"><div class="more">More</div></a>
				</li>
			</ul>
		</div>

		<aside>
			<div class="weather">
			
			</div>
			<div>
			
			</div>
		</aside>
	</section>
	
		<footer style="position: absolute;">
		<div id="footer">
		    COPYRIGHT &copy; 2020 SOLO ALL RIGHTS RESERVED.
		</div>
	</footer>
</body>
</html>