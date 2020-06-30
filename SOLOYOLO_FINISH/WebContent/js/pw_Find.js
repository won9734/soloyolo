function pwFind() {
	// myId라는 name을 가진 태그의 요소를 가져와 담는다.
	var userid = document.getElementsByName( "userid" )[0];
	// 요소의 값을 공백제거한 값이 비어있거나, 요소의 값이 null이면 실행
	if( userid.value.trim() == "" || userid.value == null ) {
		alert( "아이디를 먼저 입력해주세요 T.T" );
		userid.focus();
	} else {
		// target변수에 경로를 넣어준다.
		var target = "SOLOYOLO?command=idChk&userid=" + userid.value.trim();
		
		// 새로운 창을 띄운다.
		// open( "https://www.naver.com", "", "width=200, height=200" );
		open( target, "", "width=400, height=400" );
	}
}