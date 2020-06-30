<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76c0dbd7d9068bde24079e3cd4f90525&libraries=services"></script>
<script type="text/JavaScript" src="js/join.js"></script>

<script type="text/javascript">
$(function() {
	//2020.05.15 추가
	$("#joinform").submit(function(){
	    if($("#name").val()==""||$("#name").val()==null){   
	       alert("이름을 입력하세요.");
	       $("#name").focus();
	       return false;
	    }
	    
	    if($("#nickname").val()==""||$("#nickname").val()==null){   
	       alert("닉네임을 입력하세요.");
	       $("#nickname").focus();
	       return false;
	    }
	    
	    if($("#email").val()==""||$("#email").val()==null){   
	       alert("이메일을 입력하세요.");
	       $("#email").focus();
	       return false;
	    } 
	    
	    if($("#phone1").val()==""||$("#phone1").val()==null){   
	       alert("전화번호를 입력하세요.");
	       $("#phone1").focus();
	       return false;
	    }       
	    
	    if($("#phone2").val()==""||$("#phone2").val()==null){   
	       alert("전화번호를 입력하세요.");
	       $("#phone2").focus();
	       return false;
	    } 
	    
	    if($("#height").val()==""||$("#height").val()==null){   
	       alert("키를 입력하세요.");
	       $("#height").focus();
	       return false;
	    } 
	    
	    if($("#weight").val()==""||$("#weight").val()==null){   
	       alert("몸무게를 입력하세요.");
	       $("#weight").focus();
	       return false;
	    } 
	    
	    if($("#address_etc").val()==""||$("#address_etc").val()==null){   
	       alert("상세주소를 입력하세요.");
	       $("#address_etc").focus();
	       return false;
	    }
	    
	    if($( 'input[name=favogenre]:checked' ).length < 1){
	       alert("선호영화를 하나이상 선택하세요.");
	       return false;
	    }
	    
	    if($( 'input[name=favoht]:checked' ).length < 1){
	       alert("선호운동을 하나이상 선택하세요.");
	       return false;
	    }
	 });
});
</script>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="joinbox">
		<div id="logo">
			<img src="images/logo.png">
		</div>
		<form action="SOLOYOLO" method="POST" id="joinform">
			<input type="hidden" name="command" value="insertMember"/>
			<input type="hidden" name="grade" value="USER"/>
			<ul class="info">
				<li>
					<input type="text" name="userid" id="userid" placeholder="Id" class="input_style">
				</li>
				<li>
					<input type="password" name="userpw" placeholder="Password" id="pw" data-validation="custom" class="input_style" onclick="idChk();">
				</li>
				<li>
					<input type="password" name="userpw_Chk" placeholder="Password 확인" id="ch_pw" data-validation="confirmation" data-validation-error-msg="패스워드가 다릅니다." class="input_style" onfocus="pwcheckz();">
				</li>
				<li>
					<input type="text" name="name" id="name" placeholder="Name" class="input_style" onfocus="pwChk();">
				</li>
				<li>
					<input type="text" name="nickname" id="nickname" placeholder="Nickname" class="input_style">
				</li>
				<li>
					<input type="text" name="email" id="email" placeholder="Email" class="input_style input_email">
					 @ <input type="text" name="e_domain" class="input_style input_email">
					 
					 <select name="domain" class="input_style input_email" onchange="domainCheck();">
						<option value="0" selected="selected">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
					</select>
				</li>
				<li>
					<select name="phone" class="input_style input_phone">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					 - <input type="tel" name="phone1" id="phone1" class="input_style input_phone" maxlength="4">
					 - <input type="tel" name="phone2" id="phone2" class="input_style input_phone" maxlength="4">
				</li>
				<li>
					<input type="text" name="height" id="height" placeholder="Height" class="input_style input_style2"> cm
					&nbsp;&nbsp;
					<input type="text" name="weight" id="weight" placeholder="Weight" class="input_style input_style2"> kg
				</li>
				<li>
					<input id="zonecode" type="text" name="postCode" readonly placeholder="Postcode" class="input_style input_addr" />
					<input type="button" onClick="openDaumZipAddress();" value="주소 찾기" class="input_style input_addr2" />
				</li>
				<li>
					<input type="text" id="address" name="addr" readonly class="input_style input_addr3" placeholder="Address" />
				</li>
				<li>
					<input type="text" id="address_etc" name="addr_Detail" placeholder="DetailAddress" class="input_style input_addr3" />
					<input type="hidden" id="x" name="namex">
					<input type="hidden" id="y" name="namey">
				</li>
				<ul class="favogenre">
					<p>선호하는 영화 장르(최대3개)</p>
					<li>
						<input type="checkbox" id="favogenre1" name="favogenre" value="액션" onclick="over();">
						<label for="favogenre1">액션</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre2" name="favogenre" value="SF" onclick="over();">
						<label for="favogenre2">SF</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre3" name="favogenre" value="멜로" onclick="over();">
						<label for="favogenre3">멜로</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre4" name="favogenre" value="드라마" onclick="over();">
						<label for="favogenre4">드라마</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre5" name="favogenre" value="코미디" onclick="over();">
						<label for="favogenre5">코미디</label>
					</li>
				</ul>
				<ul class="favogenre">
					<li>
						<input type="checkbox" id="favogenre6" name="favogenre" value="공포" onclick="over();">
						<label for="favogenre6">공포</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre7" name="favogenre" value="스릴러" onclick="over();">
						<label for="favogenre7">스릴러</label>
					</li>
					<li>
						<input type="checkbox" id="favogenre8" name="favogenre" value="애니메이션" onclick="over();">
						<label for="favogenre8">애니메이션</label>
					</li>
				</ul>
				<ul class="favoht">
					<p>선호하는 운동(최대3개)</p>
					<li>
						<input type="checkbox" id="favoht1" name="favoht" value="전신">
						<label for="favoht1" onclick="over();">전신</label>
					</li>
					<li>
						<input type="checkbox" id="favoht2" name="favoht" value="복부">
						<label for="favoht2" onclick="over();">복부</label>
					</li>
					<li>
						<input type="checkbox" id="favoht3" name="favoht" value="상체">
						<label for="favoht3" onclick="over();">상체</label>
					</li>
					<li>
						<input type="checkbox" id="favoht4" name="favoht" value="하체">
						<label for="favoht4" onclick="over();">하체</label>
					</li>
					<li>
						<input type="checkbox" id="favoht5" name="favoht" value="스트레칭">
						<label for="favoht5" onclick="over();">스트레칭</label>
					</li>
				</ul>
			</ul>
			<div class="joinbtnbox">
				<button type="submit" class="joinbtn">회원가입</button>
				<button type="button" class="joincancelbtn" onclick="location.href='login.jsp'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>