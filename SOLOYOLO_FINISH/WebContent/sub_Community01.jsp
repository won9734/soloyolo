<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY_LIST</title>

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/sub_Community01.js"></script>
<script type="text/javascript">
	
</script>

<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/community.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<section>
		<div class="swiper-container slide">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="images/slide/movie_slide01.png"></div>
				<div class="swiper-slide"><img src="images/slide/movie_slide02.png"></div>
				<div class="swiper-slide"><img src="images/slide/movie_slide03.png"></div>
			</div>
			<div class="swiper-pagination">
				
			</div>
		</div>

<script src="js/swiper.js"></script>

		<div class="container2">
			<p class="cm_subtitle">자유 게시판</p>
			<hr>
			<c:set var="count" value="0" />
			<c:forEach var="i" begin="1" end="5" step="1">
				<table class="container2 table">
					<thead class="thead">
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty comList }">
							<tr>
								<td colspan="7" align="center">--- 작성된 게시글 이 없습니다. ----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${ comList }" begin="${ count }" end="${ count + 9 }">
								<tbody class="tbody">
									<tr>
										<td>${ list.comno }</td>
										<td>
											<c:choose>
												<c:when test="${ list.divno == 1 }">
													Culture
												</c:when>
												<c:when test="${ list.divno == 2 }">
													Home Trainning
												</c:when>
												<c:when test="${ list.divno == 3 }">
													Cook
												</c:when>
												<c:when test="${ list.divno == 4 }">
													Delivery
												</c:when>
												<c:otherwise>
													일치하는 항목이 없습니다.
												</c:otherwise>
											</c:choose>
										</td>
										<td><a href="SKILLSOLOYOLO?command=communityDetail&comno=${ list.comno }&divno=${ list.divno }">${ list.title }</a></td>
										<td>${ list.nickName }</td>
										<td>${ list.viewNum }</td>
										<td>${ list.recomNum }</td>
										<td>${ list.regdate }</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<c:set var="count" value="${ count + 10 }" />
				</table>
			</c:forEach>
			<div class="write_btn">
				<button onclick="location.href='SKILLSOLOYOLO?command=communityWrite'">글쓰기</button>
			</div>
			<div class="page">
				<ol>
					<!-- <li><a href="#"><img src="images/page_left.png"></a></li> -->
					<c:forEach var="i" begin="1" end="${ Math.ceil( comList.size() / 10 ) }" step="1">
						<li><a href="#" id="${ i - 1 }" name="button" onclick="page1(this.id);">${ i }</a></li>
					</c:forEach>
					<!-- <li><a href="#"><img src="images/page_right.png"></a></li> -->
				</ol>
			</div>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>