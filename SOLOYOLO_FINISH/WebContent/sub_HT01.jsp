<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME_TRAINING_LIST</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/sub_HT01.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/ht.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="swiper-container slide">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="images/slide/hometraining_slide01.png"></div>
				<div class="swiper-slide"><img src="images/slide/hometraining_slide02.png"></div>
				<div class="swiper-slide"><img src="images/slide/hometraining_slide03.png"></div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
<script src="js/swiper.js"></script>

		<form action="SKILLSOLOYOLO" id="select" method="POST">
			<input type="hidden" name="command" value="htSearch"/>
			<table>
				<tr>
					<th>운동검색</th>
					<td><input type="search" name="search" id="search" placeholder="키워드를 입력해주세요"></td>
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
								<input type="checkbox" id="genre01" name="genre" value="전신">
								<label for="genre01">전신</label>
							</li>
							<li>
								<input type="checkbox" id="genre02" name="genre" value="복부">
								<label for="genre02">복부</label>
							</li>
							<li>
								<input type="checkbox" id="genre03" name="genre" value="상체">
								<label for="genre03">상체</label>
							</li>
							<li>
								<input type="checkbox" id="genre04" name="genre" value="하체">
								<label for="genre04">하체</label>
							</li>
							<li>
								<input type="checkbox" id="genre05" name="genre" value="스트레칭">
								<label for="genre05">스트레칭</label>
							</li>
							<li>
								<input type="checkbox" id="genre06" name="recommend" value="${ login_Res.favoht }">
								<label for="genre06">추천</label>
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
			<ul class="clearFix">
				<p>인기 동영상</p>
				<c:forEach items="${ htListReverse }" var="ht" begin="0" end="2">
					<li>
						<a href="SKILLSOLOYOLO?command=htOne&htno=${ ht.htno }&cal=0">
						<img src="${ ht.pic }"></a>
						<span>${ ht.name }</span>
					</li>
				</c:forEach>
			</ul>

			<c:set var="count" value="0"/>
				<c:forEach var="i" begin="1" end="5" step="1">
					<ul class="clearFix new">
						<p>최신 동영상</p>
							<c:forEach items="${ htList }" var="ht" begin="${ count }" end="${ count + 8 }">
							<li>
								<a href="SKILLSOLOYOLO?command=htOne&htno=${ ht.htno }&cal=0">
									<img src="${ ht.pic }">
								</a>
								<span>${ ht.name }</span>
							</c:forEach>
						</li>
					</ul>
				<c:set var="count" value="${ count + 9 }"/>
			</c:forEach>





			<div class="page">
				<ol>
					<!-- <li><a href="#"><img src="images/page_left.png"></a></li> -->
					<c:forEach var="i" begin="1" end="${ Math.ceil( htList.size() / 10 ) }" step="1">
						<li><span href="#" id="${ i - 1 }" name="button" onclick="page1(this.id);">${ i }</span></li>
					</c:forEach>
					<!-- <li><a href="#"><img src="images/page_right.png"></a></li> -->
				</ol>
			</div>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>