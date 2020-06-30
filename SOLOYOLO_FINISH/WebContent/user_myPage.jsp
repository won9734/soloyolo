<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY_PAGE</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="./js/user_myPage.js"></script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	<%@ include file="./form/header.jsp"%>
	<section>
		<div class="container2 mymenu">
			<ul class="clearFix">
				<li><a href="#">회원 정보</a></li>
				<li><a href="#cal">칼로리 그래프</a></li>
				<li><a href="#sns">개인 SNS</a></li>
				<li><a href="#favo">즐겨찾기</a></li>
				<li><a href="#his">히스토리</a></li>
			</ul>
		</div>
		<div class="container2">
			<p class="my_subtitle">회원 정보</p>
			<hr>
			<table class="user_info">
				<tr>
					<th>아이디:</th>
					<td>${ userInfo.getUserid() }</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${ userInfo.getName() }</td>
				</tr>
				<tr>
					<th>닉네임:</th>
					<td>${ userInfo.getNickname() }</td>
				</tr>
				<tr>
					<th>이메일:</th>
					<td>${ userInfo.getEmail() }</td>
				</tr>
				<tr>
					<th>핸드폰:</th>
					<td>${ userInfo.getPhone() }</td>
				</tr>
				<tr>
					<th>키:</th>
					<td>${ userInfo.getHeight() }cm</td>
				</tr>
				<tr>
					<th>몸무게:</th>
					<td>${ userInfo.getWeight() }kg</td>
				</tr>
				<tr>
					<th>주소:</th>
					<td>${ userInfo.getAddr() },${ userInfo.getAddr_Detail() }</td>
				</tr>
				<tr>
					<th>선호 장르:</th>
					<td>${ userInfo.favogenre }</td>
				</tr>
				<tr>
					<th>선호 운동:</th>
					<td>${ userInfo.favoht }</td>
				</tr>
				<tr>
					<th>가입일:</th>
					<td>${ userInfo.getSubdate() }
				</tr>
				<tr>
					<td colspan="2" class="user_btn">
						<button onclick="location.href='SOLOYOLO?command=userInfoUpdate&userno=${ userInfo.getUserno() }'">회원정보 수정</button>
						<button onclick="location.href='SOLOYOLO?command=userDelete&userno=${ userInfo.getUserno() }&grade=${ userInfo.getGrade() }'">회원 탈퇴</button>
					</td>
				</tr>
			</table>
		</div>

		<a name="cal" class="scroll"></a>
		<div class="container2">
			<p class="my_subtitle">칼로리 그래프</p>
			<hr>
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
			<script type="text/javascript">
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
					function drawChart() {
						/* var data = google.visualization.arrayToDataTable([
							['작성일', '소비칼로리', '섭취칼로리'],
							['0420',  1000,      400],
							['0421',  1170,      460],
							['0422',  660,       1000],
							['0424',  1030,      1740],
							['0425',  1030,      640],
							['0426',  1030,      1940],
							['0427',  1030,      340],
						]); */
						
						var data = google.visualization.arrayToDataTable([
							[ '작성일', '소비 칼로리', '섭취 칼로리' ], 
							<c:forEach var="cal" items="${ calList }">
							[ '${ cal.regdate }', ${ cal.subcal }, ${ cal.sumcal } ], 
							</c:forEach>
						]);
						
						var options = {
							title: '${ userInfo.name } 님의 칼로리 그래프', 
							titleTextStyle:{color: '#000000'},
							curveType: 'none',
							legend: { position: 'bottom' }
						};
						
						var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
						
						chart.draw(data, options);
					}
				</script>
			<div id="curve_chart" style="width: 1000px; height: 500px;"></div>
		</div>

		<a name="sns" class="scroll"></a>
		<div class="container2">
			<p class="my_subtitle">개인 SNS</p>
			<hr>
			<div class="write_btn">
				<button onclick="location.href='SKILLSOLOYOLO?command=snsWrite'">글쓰기</button>
			</div>
			<c:choose>
				<c:when test="${ empty snsList }">
					<p align="center">---- ${ userInfo.nickname } 님의 SNS가 존재하지 않습니다. ----</p>
				</c:when>
					<c:otherwise>
						<c:forEach var="sns" items="${ snsList }" varStatus="i">
							<div class="user_sns">
								<p>${ sns.nickname }</p>
								<p>${ sns.regdate }</p>
								<div class="sns_write">
									<pre>${ sns.content }</pre>
									<img src="images/snsFiles/${ sns.fileurl }">
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
			</c:choose>
			
		</div>

		<a name="favo" class="scroll"></a>
		<div class="container2">
			<p class="my_subtitle">즐겨찾기</p>
			<hr>
			<ul class="user_pin">
				<li>
					<div>
						<c:choose>
							<c:when test="${ empty favoList }">
								<p align="center">---- ${ userInfo.nickname } 님의 즐겨찾기가 존재하지 않습니다. ----</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="favo" items="${ favoList }" varStatus="i">
									<c:choose>
										<c:when test="${ favo.divno == 1 }">
											<p class="pin_title"><a href="SOLOYOLO?${ favo.favoAddr }&divno=1">${ favo.title }</a></p>
											<a href="SOLOYOLO?${ favo.favoAddr }&divno=1" class="favo_img">${ favo.img }</a>
										</c:when>
										<c:when test="${ favo.divno == 2 }">
											<p class="pin_title"><a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0">${ favo.title }</a></p>
											<a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0" class="favo_img">
												<img src="${ favo.img }"/>
											</a>
										</c:when>
										<c:when test="${ favo.divno == 3 }">
											<p class="pin_title"><a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0">${ favo.title }</a></p>
											<a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0" class="favo_img">
												<img src="${ favo.img }"/>
											</a>
										</c:when>
										<c:when test="${ favo.divno == 4 }">
											<p class="pin_title"><a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0">${ favo.title }</a></p>
											<a href="SKILLSOLOYOLO?${ favo.favoAddr }&cal=0" class="favo_img">
												<img src="${ favo.img }"/>
											</a>
										</c:when>
									</c:choose>
									<p class="pin_date">${ favo.regdate }</p>
									<input type="hidden" class="pin_btn_val${ i.index }" value="${ favo.favoAddr }"/>
									<button class="pin_btn" id=${ i.index } onclick="delFavo( this.id );">삭제</button>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<!-- <p class="pin_title">제목 들어가는 곳</p>
						<p class="pin_id">별명</p>
						<p class="pin_date">2020.04.23</p>
						<button class="pin_btn">삭제</button> -->
					</div>
				</li>
			</ul>
		</div>
<script type="text/javascript">
	/* $(function() {
		$( "#pin_btn" ).click(function() {
			$( ".pin_btn_val" ).each(function( i ) {
				var addrFavo = $( ".pin_btn_val" )[i].value;
				alert( addrFavo );
			});
		});
	}); */
	
	function delFavo( id ) {
		var command = "command=delFavo";
		var userno = "userno=${ login_Res.userno }";
		var grade = "grade=${ login_Res.grade }";
		var arr = document.getElementsByClassName( "pin_btn_val" + id );
		arr = "favoAddr=" + encodeURIComponent( arr[0].value );
		var str = 'SOLOYOLO?' + command + '&' + userno + '&' + grade + '&' + arr;
		// alert( str );
		location.href = str;
	}
</script>

		<a name="his" class="scroll"></a>
		<div class="container2 history">
			<p class="my_subtitle">히스토리</p>
			<hr>
			<div class="user_history clearFix">
				<!-- <ul class="clearFix"> -->
				<!-- <ul class="user_pin"> -->
					<!-- <li> -->
					<c:choose>
						<c:when test="${ empty hisList }">
							<p align="center">---- ${ userInfo.nickname } 님의 히스토리가 존재하지 않습니다. ----</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="his" items="${ hisList }" varStatus="i">
								<c:choose>
									<c:when test="${ his.divno == 1 }">
										<div class="his_img">
											<a class="pin_title">${ his.title }</a>
											<p><a href="SOLOYOLO?${ his.hisAddr }&divno=1" class="favo_img">${ his.img }</a></p>
											<p class="pin_date">${ his.regdate }</p>
										</div>
									</c:when>
									<c:when test="${ his.divno == 2 }">
										<div class="his_img">
											<a class="pin_title">${ his.title }</a>
											<p><a href="SKILLSOLOYOLO?${ his.hisAddr }&cal=0" class="favo_img"><img src="${ his.img }"/></a></p>
											<p class="pin_date">${ his.regdate }</p>
										</div>
									</c:when>
									<c:when test="${ his.divno == 3 }">
										<div class="his_img">
											<a class="pin_title">${ his.title }</a>
											<p><a href="SKILLSOLOYOLO?${ his.hisAddr }&cal=0" class="favo_img"><img src="${ his.img }"/></a></p>
											<p class="pin_date">${ his.regdate }</p>
										</div>
									</c:when>
									<c:when test="${ his.divno == 4 }">
										<div class="his_img">
											<a class="pin_title">${ his.title }</a>
											<p><a href="SKILLSOLOYOLO?${ his.hisAddr }&cal=0" class="favo_img"><img src="${ his.img }"/></a></p>
											<p class="pin_date">${ his.regdate }</p>
										</div>
									</c:when>
								</c:choose>
								<%-- <p class="pin_date">${ his.regdate }</p> --%>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- </li> -->
				<!-- </ul> -->
				</div>
			</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>