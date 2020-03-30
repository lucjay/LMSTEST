<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function idCheck() {
		var id = document.frm.id.value;
		window.open("idCheck.do?id=" + id, "ID CHECK",
				"width=300, height=300, menubar=no, status=no, toolbar=no");
	}
</script>
</head>
<body>
	<div class="w3-content w3-container w3-padding-100">
		<div class="w3-content" style="max-width: 1500px">
			<header class="w3-panel w3-center w3-opacity"
				style="padding: 5px 16px">
				<h1 class="w3-xlarge">WELCOME</h1>
				<h1>join</h1>
			</header>
		</div>
		<div align="center">
			<div class="w3-higt-padding" style="margin: 0 -16px 8px 300px">
				<div class="w3-half">
					<form id="frm" name="frm" action="memberInsert.do" method="post"
						target="_blank" onSubmit="logincall();return false"
						enctype="Multipart/form-data">
						<p>
							<input class="w3-input w3-border" type="text" placeholder="＊NAME"
								name="name" id="name" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="text" placeholder="＊ID"
								id="id" name="id" size="30" required><br>
							<button class="w3-button w3-black" type="button"
								onclick="idCheck()">ID CHECK</button>
						</p>
						<p>
							<input class="w3-input w3-border" type="password"
								placeholder="＊PW" name="pw" id="pw" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="password"
								placeholder="＊PW Check" name="pwc" id="pwc" required>
						</p>
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="ADDRESS" name="address" id="address">
						</p>
						<p>
							<input class="w3-input w3-border" type="text"
								placeholder="MOBILE" name="tel" id="tel">
						</p>
						<p>
							<input type="radio" id="gender" name="gender" value="male">M&nbsp;
							<input type="radio" id="gender" name="gender" value="female">W
						</p>
						<p>
							<input type="checkbox" id="hobby" name="hobby" value="운동 ">운동&nbsp;
							<input type="checkbox" id="hobby" name="hobby" value="영화 ">영화&nbsp;
							<input type="checkbox" id="hobby" name="hobby" value="음악 ">음악&nbsp;
							<input type="checkbox" id="hobby" name="hobby" value="기타 ">기타
						</p>
						<p>
							<input class="w3-input w3-border" type="file" placeholder="PHOTO"
								name="filename" id="filename">
						</p>



						<button class="w3-button w3-black" type="submit"
							onclick="formDataCheck()" value="JOIN">
							<i class="fa fa-paper-plane"></i> JOIN
						</button>
						&nbsp;&nbsp;
						<button class="w3-button w3-black" type="reset" value="RESET">RESET</button>
						&nbsp;&nbsp;
						<button class="w3-button w3-black" type="button" value="HOME"
							onclick="location.href='home.do'">HOME</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>

</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>