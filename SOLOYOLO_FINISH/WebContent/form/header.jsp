<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>

<link rel="stylesheet" href="css/common.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<header>
    <div id="logo">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <script type="text/javascript">
    $.getJSON('http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=199c85aff3b45915476cbf4986ce7581&units=metric',
    function(data){
        //data로 할일....
        //alert(data.list[0].main.temp_min);
        var $minTemp=data.main.temp_min+' ºC';
        var $maxTemp=data.main.temp_max+' ºC';
        var $cTemp=data.main.temp+' ºC';
        var $now=new Date(Date.now());
        var $cDate=$now.getFullYear() + '년' + 0+($now.getMonth()+1) + '월'+ $now.getDate() + '일' + $now.getHours() + '시' + $now.getMinutes()+'분';
        var icon=data.weather[0].icon;
        var Tdes=data.weather[0].description;
        //alert(new Date(Date.now()));
        
        $(".clowtemp").append($minTemp);
        $(".chightemp").append($maxTemp);
        $(".ctemp").append($cTemp);
        $("#date").prepend($cDate);
        $('.cicon').append('<img src="http://openweathermap.org/img/wn/'+icon+'@2x.png" />');
        $('.des').append(Tdes);

    });
    </script>
    <div class="bo" style="width:400px; height:150px; position:absolute; top:0px; left:0px;">
        <div class="cicon" style="position:absolute; top:1%; left:40px;"></div>
        <div class="des" style="position:absolute; top:110px; left:20px;"></div>
        <p id="date" style="position:absolute; top:20px; left:180px;"></p>
        <div class="ctemp" style="position:absolute; top:60px; left:180px;">현재온도:</div>
        <div class="clowtemp" style="position:absolute; top:85px; left:180px;">최저온도:</div>
        <div class="chightemp" style="position:absolute; top:110px; left:180px;">최고온도:</div>
    </div>
    	<a href="main.jsp">
    		<img src="images/logo.png">
    	</a>
    </div>
    <div class="nav">
        <ul id="nav_menu">
            <li><a href="SOLOYOLO?command=mList&grade=${ login_Res.grade }">Culture</a></li>
            <li><a href="SKILLSOLOYOLO?command=htList">Home Training</a></li>
            <li><a href="SKILLSOLOYOLO?command=cookList">Cooking</a></li>
            <li><a href="SKILLSOLOYOLO?command=deliveryList">Delivery</a></li>
            <li><a href="SKILLSOLOYOLO?command=communityList">Community</a></li>
        </ul>
        <ul id="login">
          <li><a href="SOLOYOLO?command=myPage&userno=${ login_Res.getUserno() }&grade=${ login_Res.getGrade() }">마이페이지</a></li>
            <li><a href="SOLOYOLO?command=logout">로그아웃</a></li>
        </ul>
    </div>
</header>
</body>
</html>