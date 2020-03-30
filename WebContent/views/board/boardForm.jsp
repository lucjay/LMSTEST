<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<script type="text/javascript">
	function formDataCheck() {
		var form = document.frm;
		if (form.writer.value == "") {
			alert("작성자 이름을 입력하세요.");
			form.writer.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}

		if (form.contents.value == "") {
			alert("내용을 입력하세요.");
			form.contents.focus();
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
			<h1>write</h1>
		</header>
	</div>
	<div align="center">
		<div>
			<br>
		</div>
		<div>
			<form id="frm" name="frm" action="boardInsert.do" method="post"
				enctype="Multipart/form-data">
				<div>
					<table border="0">
						<tr>
							<th bgcolor="#dcdcdc" width="100" height="50">WRITER</th>
							<td><input type="text" id="writer" name="writer" size="15"
								maxlength="15"></td>
							<th bgcolor="#dcdcdc">DATE</th>
							<td><input type="date" id="wdate" name="wdate" size="15"
								maxlength="15"></td>
						</tr>
						<tr>
							<th bgcolor="#dcdcdc" width="100" height="50">TITLE</th>
							<td colspan="3"><input type="text" id="title" name="title"
								size="45" maxlength="45"></td>
						</tr>
						<tr>
							<th bgcolor="#dcdcdc">CONTENTS</th>
							<td colspan="3"><textarea name="contents" id="contents"
									name="contents" cols="46" rows="13"></textarea></td>
						</tr>
						<tr>
							<th bgcolor="#dcdcdc">FILE</th>
							<td colspan="3"><input type="file" id="filename"
								name="filename"></td>
						</tr>
					</table>
				</div>
				<div align="center">
					<br> &nbsp; &nbsp; <input type="button"
						onclick="formDataCheck()" value="글등록"> &nbsp;&nbsp;<input
						type="reset" value="취소">&nbsp;&nbsp; <input type="button"
						value="목록보기" onclick="location.href='boardList.do'"> <br>
					<br>
				</div>
			</form>
		</div>
	</div>
	<br>
</body>
</html>

<jsp:include page="../common/tail.jsp"></jsp:include>