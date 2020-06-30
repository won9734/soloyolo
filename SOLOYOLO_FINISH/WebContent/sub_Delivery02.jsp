<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELIVERY_DETAIL</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--  <script type="text/javascript" src="js/sub_Delivery01.js"></script> -->
<script type="text/javascript">
function getFavorites() {
/*
	encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, ?, &등을 제외하고 인코딩하는 함수
		↑
		↓
	decodeURI()
	
	encodeURIComponent() : 모든 문자를 인코딩하는 함수
		↑
		↓
	decodeURIComponent()
*/
	var command = "command=getFavo";
	var divno = "divno=4";
	var boardno = "boardno=${ shopOne.sno }";
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ shopOne.name }";
	var favoAddr = "favoAddr=" + encodeURIComponent( 'command=${ command }&sno=${ shopOne.sno }&divno=4' );
	return '?' + command + '&' + divno + '&' + boardno + '&' + userno + '&' + title + '&' + favoAddr;
}
/*
	JSON : JavaScript Object Notation, 제이슨
	경량 데이터 형식
	{ name:value, name:value, ... }와 같은 형식
*/
// [ 즐겨찾기 AJAX ]
$(function() {
	$( "#starbox" ).click(function() {
		$.ajax({
			// calScore라는 SERVLET과 맵핑
				url : "SOLOYOLO" + getFavorites(), 
				type: 'POST', 
				// 서버에서 받을 데이터 형식 지정 → json타입으로 데이터를 받겠다.
				dataType : "Json", 
				async: false, 
				success : function( msg ) {
					// alert( msg );
					// CalScore에서 보내는건 String을 보내지만, 받는 데이터 타입이 json이므로, Object로 형 변환하여 들어온다.
					// CalScore에서 객체로 보내게되면, 객체의 주소를 받게된다. 그러므로 위와같이 보낸다.
					alert( msg.divBoard + "게시판의 " + msg.sno + "번 게시글을 즐겨찾기 하였습니다.\n" + "즐겨찾기 등록 성공 :D" );
					// alert( "즐겨찾기 등록 성공 :D" );
				}, 
				// 서버에 요청을 했지만, 돌아오는 응답이 없으므로 실패
				error : function() {
					alert( "이미 즐겨찾기에 등록된 게시글 입니다.\n" + "즐겨찾기 등록 실패 T.T" );
				}
			});
		});
	
	// [ 댓글 AJAX ]
	//데이터 전송
	$( "#click" ).click(function() {
		var command = $( '#command' ).val();
		var userno = $( '#userno' ).val();
		var divno = $( '#divno' ).val();
		var boardno = $( '#boardno' ).val();
		var nickname = $( '#nickname' ).val();
		var content = $( '#content' ).val();
		
		$.ajax({
			url : 'SKILLSOLOYOLO', 
			type : 'POST', // 데이터를 서버로 전송하게 된다.
			data : {
				'command' : command, 
				'userno' : userno, 
				'divno' : divno, 
				'boardno' : boardno, 
				'nickname' : nickname, 
				'content' : content
			},
			success : function() {
				alert( "댓글 작성 성공 !!!" );
				location.reload();
			},
			error : function() {
				alert( '댓글 작성 실패 T.T' );
			}
		});
	})
	
	
	// [ 히스토리 AJAX ]
	$.ajax({
	// calScore라는 SERVLET과 맵핑
		url : "SOLOYOLO" + getHistory(), 
		type: 'POST', 
		// 서버에서 받을 데이터 형식 지정 → json타입으로 데이터를 받겠다.
		dataType : "Json", 
		success : function( msg ) {
			// alert( msg );
			// CalScore에서 보내는건 String을 보내지만, 받는 데이터 타입이 json이므로, Object로 형 변환하여 들어온다.
			// CalScore에서 객체로 보내게되면, 객체의 주소를 받게된다. 그러므로 위와같이 보낸다.
			// alert( msg.divBoard + "게시판의 " + msg.sno + "번 게시글을 히스토리에 등록 하였습니다.\n" );
			// alert( "즐겨찾기 등록 성공 :D" );
		}, 
		// 서버에 요청을 했지만, 돌아오는 응답이 없으므로 실패
		error : function() {
			// alert( "히스토리가 업데이트 되었습니다." );
		}
	});
});


function getHistory() {
/*
	encodeURI() : 인터넷 주소에서 사용하는 :, ;, /, ?, &등을 제외하고 인코딩하는 함수
		↑
		↓
	decodeURI()
	
	encodeURIComponent() : 모든 문자를 인코딩하는 함수
		↑
		↓
	decodeURIComponent()
*/
	
	
	var command = "command=getHis";
	var divno = "divno=4";
	var boardno = "boardno=${ shopOne.sno }";
	var userno = "userno=${ login_Res.userno }";
	var title = "title=${ shopOne.name }";
	var hisAddr = "hisAddr=" + encodeURIComponent( 'command=${ command }&sno=${ shopOne.sno }&divno=4' );
	return '?' + command + '&' + divno + '&' + boardno + '&' + userno + '&' + title + '&' + hisAddr;
}
/*
	JSON : JavaScript Object Notation, 제이슨
	경량 데이터 형식
	{ name:value, name:value, ... }와 같은 형식
*/



var divs = document.getElementsByClassName( "comment_list" );
var buttons = document.getElementsByName( "button" );

$(function() {
   divs[0].style.display = "block";
   divs[1].style.display = "none";
   divs[2].style.display = "none"; 
   divs[3].style.display = "none"; 
   divs[4].style.display = "none"; 
});

function page1( idName ) {
   for( var i = 0; i < buttons.length; i++ ) {
      if( idName == i ) {
          divs[i].style.display = "block";
          buttons[i].style.background = "#9CE9FF";
          buttons[i].style.color = "#fff";
          buttons[i].style.borderRadius = "5px";
      }else{
          divs[i].style.display = "none";
          buttons[i].style.background = "white";
          buttons[i].style.color = "#000";
          buttons[i].style.borderRadius = "5px";
      }
   }
}

function pickme(menuName, price, cal){
   var menu = document.getElementsByClassName( "emptyMenu" );
   var menu1 = document.getElementsByClassName( "sumcal" );
   
   var string = "<li class='cost' value="+price+"> "+menuName+"  "+price+"원 </p></li>";
   var hidden = "<li class='hidden' style='display:none;' value="+cal+"></li>";
   
   
   menu[0].innerHTML += string;
   menu1[0].innerHTML += hidden;   
   
   var sumcal = $(".sumcal").children();
   var children = $(".emptyMenu").children();
   
   sum =0;
   calsum=0;
   
   for(var i=0; i<children.length;i++){
      calsum += sumcal[i].value;
      sum += children[i].value;
   }
    var caltotal = $('#incal');
    var total =  $('#inorder');
    total.attr('value',sum);
    total.text(sum+' 원');
    caltotal.attr('value',calsum);
    
}

function pay(){
   alert(calsum);
   location.href="pay.jsp?userno=${login_Res.userno }&sno=${ shopOne.sno }&divno=4&name=${ login_Res.name }&email=${ login_Res.email }&phone=${ login_Res.phone }&address=${ login_Res.addr }&totalprice="+sum+"&calsum="+calsum;
   
}

function cancle(){
   var cho = document.getElementById("order");
   var cho2 = document.getElementById("emptyM");
   cho.innerHTML ="<div id='inorder' > 주문 내역이 없습니다 </div>";
   
   cho2.innerHTML= "";
   
}

</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/delivery.css">
</head>
<body>
<%@ include file="./form/header.jsp"%>
<section>
   <div class="del_img" id="img_load">
      <script type="text/javascript">
         window.onload = function() {
            var img_load = document.getElementById( "img_load" );
            
            /* <c:forEach items="${ menuImgs }" var="imgs">
               img_load.innerHTML += '<div class="del_imgs">' + "${ imgs }" + '</div>';
            </c:forEach> */
			<c:forEach items="${ menuList }" var="menu">
				img_load.innerHTML += '<div class="del_imgs"><img src=' + "${ menu.menuImgs }" + '></div>';
			</c:forEach>
         }
      </script>
   </div>

   <div class="container2 del_resdetail">
      <div class="del_subtitle">
         <p>${ shopOne.name }
            <span>${ shopOne.score }</span>
         </p>
         <p>샌드위치 </p> 
      </div>
      <hr>
      <div class="clearFix">
         <table>
            <tbody>
               <tr>
                  <th>주소</th> 
                  <td>${ shopOne.addr }  </td> 
               </tr>
               <tr>
                  <th>연락처</th>
                  <td>${ shopOne.phone }</td>
               </tr>
               <tr>
                  <th>영업시간</th>
                  <td>${ shopOne.stime }</td>
               </tr>
               <tr>
                  <th>메뉴</th>
                        <td>
                            <ul class="menu" >
                               <c:forEach items="${ menuList }" var="Menu" varStatus="i" >
                                  <li id="li${ i.index }" onclick="pickme('${ Menu.name }','${ Menu.price }',${Menu.cal });"><span>${ Menu.name }</span><span class="menu_price">${ Menu.price} 원</span></li>
                               </c:forEach>
                            </ul>
                        </td>
               </tr>
            </tbody>
         </table>
         
            <div class="orderList">
                <div class="orderTitle">주문표</div>
                <div class="sumcal" style="display:none;"></div>
                <div class="emptyMenu" id="emptyM">
                     
                </div>
                <div id="order" >
                      <div id="inorder" > 주문 내역이 없습니다 </div>
                      <div id="incal" style="display:none;"></div>
                </div>
                <div>
                    <button id="ord" onclick="pay();">주문하기</button>
                    <button id="cancle" onclick="cancle();">초기화</button>
                    </div>
            </div>
      </div>
   </div>

	<div class="container2 favorite" style="margin-top: 40px;">
		<div class="starbox" id="starbox">
			<div class="star"></div>
			<p>즐겨찾기</p>
		</div>
	</div>
   
   <div class="container2 write">
      <p class="del_subtitle">리뷰 쓰기</p>
      <hr>
      <div class="container2 writebox">
         <div id="writeform">
            <input type=hidden id="command" value="insertComment">
            <input type=hidden id="userno" value="${ login_Res.userno }">
            <input type=hidden id="divno" value="4">
            <input type=hidden id="boardno" value="${ shopOne.sno }">
            <input type=hidden id="nickname" value="${ login_Res.nickname }">
            <textarea placeholder="리뷰를 남겨 주세요." id="content"></textarea>
            <input type="button" id="click" class="writebtn" value="등록"> 
         </div>
      </div>
   </div>

   <div class="container2 write">
      <div class="change">
         <p class="del_subtitle">총 ${ mdcomList.size() } 건</p>
         <hr>
         <ul class="write_list">
            <c:set var="count" value="0" />
            <c:forEach var="i" begin="1" end="5" step="1">
               <li>
                  <div class="comment_list">
                     <c:forEach var="comment" items="${ mdcomList }" begin="${ count }" end="${ count + 9 }">

                        <p class="write_id">${ comment.nickName }</p>
                        <p class="write_content">${ comment.content }</p>
                        <p class="write_date">${ comment.regdate }</p>
                     </c:forEach>
                     <c:set var="count" value="${ count + 10 }" />
                  </div>
               </li>
            </c:forEach>
         </ul>
      </div>
      <div class="page">
         <ol>
            <!-- <li><a href="#"><img src="/images/page_left.png"></a></li> -->
            <c:forEach var="i" begin="1" end="${ Math.ceil( mdcomList.size() / 10 ) }" step="1">
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