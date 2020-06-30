<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding( "UTF-8" ); %>
<% response.setContentType( "text/html; charset=UTF-8" ); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID_CHECK</title>

<script type="text/javascript">
	onload = function() {
		var id = opener.document.getElementsByName("userid")[0].value;
		document.getElementsByName("id")[0].value = id;
	}

	function confirm(idNotUsed) {
		if (idNotUsed == "true") {
			opener.document.getElementsByName("userpw")[0].focus();
		} else {
			opener.document.getElementsByName("userid")[0].focus();
		}

		self.close();
	}
</script>
</head>
<body>
	<input type="text" name="id" />
	${ idNotUsed == true ? "아이디 생성 가능" : "해당 아이디 존재" }
	<input type="button" value="CHECK" onclick="confirm( '${ idNotUsed }' );" />
</body>
</html>