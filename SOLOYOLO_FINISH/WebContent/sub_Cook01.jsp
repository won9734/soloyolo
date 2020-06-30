<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COOK_LIST</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/sub_Cook01.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/cooking.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="swiper-container slide">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="images/slide/cook_slide01.png"></div>
				<div class="swiper-slide"><img src="images/slide/cook_slide02.png"></div>
			</div>
			<div class="swiper-pagination"></div>
		</div>

<script src="js/swiper.js"></script>

		<form action="SKILLSOLOYOLO" id="select" method="POST">
			<input type="hidden" name="command" value="cookSearch"/>
			<table>
				<tr>
					<th>재료검색</th>
					<td><input type="search" name="search" id="search" placeholder="  검색어를 입력해주세요"></td>
				</tr>
				<tr class="genre">
					<th>장르</th>
					<td>
						<ul>
							<li>
								<input type="checkbox" id="all_genre" name="all_genre" value="전체">
								<label for="all_genre">전체</label>
							</li>
							<li>
								<input type="checkbox" id="genre01" name="genre" value="일상">
								<label for="all_genre">일상</label>
							</li>
							<li>
								<input type="checkbox" id="genre02" name="genre" value="초스피드">
								<label for="genre02">초스피드</label>
							</li>
							<li>
								<input type="checkbox" id="genre03" name="genre" value="술안주">
								<label for="genre03">술안주</label>
							</li>
							<li>
								<input type="checkbox" id="genre04" name="genre" value="다이어트">
								<label for="genre04">다이어트</label>
							</li>
							<li>
								<input type="checkbox" id="genre05" name="genre" value="간식">
								<label for="genre05">간식</label>
							</li>
							<li>
								<input type="checkbox" id="genre06" name="genre" value="야식">
								<label for="genre06">야식</label>
							</li>
						</ul>
					</td>
				</tr>
			</table>
			<div class="selectbtn">
				<button type="submit" class="round inbtn">조회</button>
				<button type="reset" class="round btn">초기화</button>
			</div>
		</form>
		
		<div class="list">
			<c:set var="count" value="0"/>
				<c:forEach var="i" begin="1" end="5" step="1">
					<ul class="clearFix">
						<c:forEach items="${ cookList }" var="cook" begin="${ count }" end="${ count + 11 }">
							<li>
								<a href="SKILLSOLOYOLO?command=cookOne&cno=${ cook.cno }&cal=0">
									<img src="${ cook.cUrl }">
								</a>
								<span>${ cook.name }</span>
							</li>
						</c:forEach>
						<c:set var="count" value="${ count + 12 }" />
					</ul>
				</c:forEach>
			</div>


		<div class="page">
			<ol>
				<!-- <li><a href="#"><img src="images/page_left.png"></a></li> -->
				<c:forEach var="i" begin="1" end="${ Math.ceil( cookList.size() / 12 ) }" step="1">
					<li><span href="#" id="${ i - 1 }" name="button" onclick="page1(this.id);">${ i }</span></li>
				</c:forEach>
				<!-- <li><a href="#"><img src="images/page_right.png"></a></li> -->
			</ol>
		</div>

	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>