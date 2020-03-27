<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>입력한 ${param.id}는 존재하지 않는 아이디입니다.</h1>
		</div>
		<div>
			<br>
		</div>
	</div>
</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>