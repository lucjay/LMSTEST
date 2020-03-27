<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Member List</title>
</head>
<body>
	<div class="w3-content" style="max-width: 1500px">
		<header class="w3-panel w3-center w3-opacity"
			style="padding: 25px 16px">
			<h1 class="w3-xlarge">MEMBER</h1>
			<h1>list</h1>
		</header>
		<div class="container" align="center">
			<div id="members" class="w3-modal"></div>
			<div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>ADDRESS</th>
							<th>MOBILE</th>
							<th>GENDER</th>
							<th>HOBBY</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty members }">
								<tr>
									<td colspan="6" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="member" items="${members }">
									<tr>
										<td>${member.id}</td>
										<td>${member.name}</td>
										<td>${member.address}</td>
										<td>${member.tel}</td>
										<td>${member.gender}</td>
										<td>${member.hobby}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>