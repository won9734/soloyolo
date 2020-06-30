<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CULTURE_LIST</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="js/sub_Culture01.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/culture.css">

</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="swiper-container slide">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="images/slide/movie_slide01.png">
				</div>
				<div class="swiper-slide">
					<img src="images/slide/movie_slide02.png">
				</div>
				<div class="swiper-slide">
					<img src="images/slide/movie_slide03.png">
				</div>
			</div>
			<div class="swiper-pagination">
			
			</div>
		</div>
		<script src="js/swiper.js"></script>
		
		<form action="SKILLSOLOYOLO" id="select" method="POST">
			<input type="hidden" name="command" value="movieSearch"/>
			<table>
				<tr>
					<th>영화검색</th>
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
								<input type="checkbox" id="genre01" name="genre" value="액션">
								<label for="genre01">액션</label>
							</li>
							<li>
								<input type="checkbox" id="genre02" name="genre" value="SF">
								<label for="genre02">SF</label>
							</li>
							<li>
								<input type="checkbox" id="genre03" name="genre" value="멜로">
								<label for="genre03">멜로</label>
							</li>
							<li>
								<input type="checkbox" id="genre04" name="genre" value="드라마">
								<label for="genre04">드라마</label>
							</li>
							<li>
								<input type="checkbox" id="genre05" name="genre" value="코미디">
								<label for="genre05">코미디</label>
							</li>
							<li>
								<input type="checkbox" id="genre06" name="genre" value="공포">
								<label for="genre06">공포</label>
							</li>
							<li>
								<input type="checkbox" id="genre07" name="genre" value="스릴러">
								<label for="genre07">스릴러</label>
							</li>
							<li>
								<input type="checkbox" id="genre08" name="genre" value="애니메이션">
								<label for="genre08">애니메이션</label>
							</li>
							<li>
								<input type="checkbox" id="genre09" name="genre" value="${ login_Res.favogenre }">
								<label for="genre09">추천</label>
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
		
		<!-- Ajax로 비동기 통신으로 새로 리스트 조회 -->
		
		<c:set var="count" value="0"/>
		
		<c:forEach var="i" begin="1" end="5" step="1">
			<div class="list">
				<ul class="clearFix">
					<c:forEach items="${ mList }" var="movie" begin="${ count }" end="${ count + 11 }">
						<li>
							<%-- <a href='SOLOYOLO?command=mDetail&mid=${ movie.mid.split( "=" )[1] }&divno=1' id="mov_detail">${ movie.murl }</a> --%>
							<a href='SOLOYOLO?command=mDetail&mid=${ movie.mid }&divno=1' id="mov_detail">${ movie.murl }</a>
							<span>${ movie.mname }</span>
						</li>
					</c:forEach>
					<c:set var="count" value="${count + 12}" />
				</ul>
			</div>
		</c:forEach>
		
		<div class="page">
			<ol>
				<c:forEach var="i" begin="1" end="${ Math.ceil( mList.size() / 12 ) }" step="1">
					<li id="${ i - 1 }" onclick="page1(this.id);">
						<span name="button">${ i }</span>
					</li>
				</c:forEach>
			</ol>
		</div>
	</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>