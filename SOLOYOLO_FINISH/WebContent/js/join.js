function idChk() {
	var userid = document.getElementsByName( "userid" )[0];
	if( userid.value.trim() == "" || userid.value == null ) {
		alert( "아이디를 입력해주세요." );
		userid.focus();
	} else if( userid.value.length < 4 || userid.value.length > 12 ) {
		idcheckz();
	} else {
		var target = "SOLOYOLO?command=idChk&userid=" + userid.value.trim();
		open( target, "", "width=400, height=400" );
	}
}

// 비밀번호 확인하여 실행되는 함수
function pwChk() {
	var realpw = document.getElementsByName("userpw")[0];
	var copypw = document.getElementsByName("userpw_Chk")[0];
	if (realpw.value != copypw.value) {
		alert("비밀번호가 다릅니다.");
		copypw.value = "";
		copypw.focus();
	}
}

// 이메일 뒷 부분 선택 시 선택한 text가 추가 됨
function domainCheck() {
	var domain = document.getElementsByName("domain")[0];
	var e_domain = document.getElementsByName("e_domain")[0];
	if (domain.value == 0) {
		e_domain.value == "";
		e_domain.disable = false;
	} else {
		e_domain.value = domain.value;
		e_domain.disable = true;
	}
}

// 선호하는 영화 장르와 선호하는 홈트레이닝 3가지 이상 선택 시 실행되는 함수
function over() {
	$(function() {
		$('input[type=checkbox]').on( 'change', function(e) {
			if ($( 'input[name=favogenre]:checked' ).length > 3 || $( 'input[name=favoht]:checked' ).length > 3) {
				$(this).prop( 'checked', false );
				alert("최대 3개 입니다!!");
			}
		});
	});
}

function idcheckz() {
	var idCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	if (!idCheck.test($("#userid").val())) {
		alert("4~12자리의 영문 대소문자와 숫자로만 입력해주세요");
		$("#userid").val("");
		$("#userid").focus();
		return false;
	}
}

function pwcheckz() {
	var passwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/);
	if ( !passwdCheck.test( $( "#pw" ).val() ) ) {
		alert( "8~16자리의 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 입력해주세요" );
		$( "#pw" ).val("");
		$( "#pw" ).focus();
		return false;
	}
}
    
function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete:function(data) {
			jQuery("#postcode1").val(data.postcode1);
			jQuery("#postcode2").val(data.postcode2);
			jQuery("#zonecode").val(data.zonecode);
			jQuery("#address").val(data.address);
			address = data.address;
			jQuery("#address_etc").focus();
			console.log(data);
			
			console.log(address);
			//여기부터
			 var geocoder = new daum.maps.services.Geocoder();
		    // 주소로 좌표를 검색
		    geocoder.addressSearch(address, function(result, status) {
		    	
		     if (status == daum.maps.services.Status.OK) {
		    	jQuery("#y").val(result[0].x);
		    	jQuery("#x").val(result[0].y);
		    	
		    	console.log(result[0].x,result[0].y);
		     }
		     // 정상적으로 검색이 완료됐으면,
		    /*  if (status == daum.maps.services.Status.OK) {
		      
		      var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		      y = result[0].x;
		      x = result[0].y;
		    	 } */
		     });
		}
	}).open();
}
