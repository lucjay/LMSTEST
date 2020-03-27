<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id Check</title>
<script type="text/javascript">
	function formClose(n) {
		if (n != 0) {
			opener.document.gelElementById("id").value = '';
			opener.document.gelElementById("id").focus();
		} else {
			opener.document.gelElementById("pw").focus();
		}
		window.close();
	}
</script>
</head>
<body>
	<div align="center">
		<c:if test="${check=='0'}">
			<h3>${param.id}는사용가능한아이디입니다.!!</h3>
		</c:if>
		<c:if test="${check=='1'}">
			<h3>${param.id}는이미사용중입니다.</h3>
		</c:if>
		<button type="button" onclick="formClose(${check})">확인</button>

	</div>
</body>
</html>