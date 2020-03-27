<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/menu.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 폼</title>
</head>

<title>LOGIN</title>
<script type="text/javascript">
	function formChecked() {
		var form = document.frm;
		if (form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}
		if (form.pw.value == "") {
			alert("패스워드를 입력하세요.")
			form.pw.focus();
			return false;
		}
		form.submit();
	}
</script>
</head>
<body>
	<div class="w3-content" style="max-width: 1500px">
		<header class="w3-panel w3-center w3-opacity"
			style="padding: 25px 16px">
			<h1 class="w3-xlarge">WELCOME</h1>
			<h1>login</h1>
		</header>
	</div>
	<div align="center">
		<form id="frm" name="frm" action="loginCheck.do" method="post">
			<div>
				<table border="0">
					<tr>
						<th>ID</th>
						<td><input type="text" id="id" name="id"></td>
					</tr>
					<tr>
						<th>PW</th>
						<td><input type="password" id="pw" name="pw"></td>
					</tr>
				</table>
			</div>

			<div>
				<br />
				<button type="button" onclick="formChecked()">LOGIN</button>
				&nbsp;&nbsp;
				<button type="reset">CANCEL</button>
				&nbsp;&nbsp;
				<button type="button" onclick="location.href='join.do' ">JOIN</button>
				<br> <br>
			</div>
		</form>
	</div>
</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>