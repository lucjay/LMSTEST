<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		작성자 : ${view.writer} <br> 작성일자 : ${view.wdate } <br> 제목 :
		${view.title } <br> 내용 : ${view.contents } <br> 조회수 :
		${view.hit } <br> 사진 : ${view.filename} <br>
		<button type="button" onclick="location.href='boardList.do'">LIST</button>
	</div>
	<br>
	<br>
</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>