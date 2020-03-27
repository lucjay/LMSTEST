<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>HOME</title>
</head>
<body>
	<header class="w3-panel w3-center w3-opacity"
		style="padding: 25px 16px">
		<div align="center">
			<div class="w3-content" style="max-width: 1500px">
				<h1 class="w3-xlarge">WELCOME</h1>
				<h1>BINWOO's HOME</h1>
				<br>
				<div>
					<br>
					<p class="w3-xlarge">
						<button
							onclick="document.getElementById('id01').style.display='block'"
							class="w3-button w3-round w3-pink w3-opacity w3-hover-opacity-off"
							style="padding: 8px 60px">LOGIN</button>
					</p>
				</div>
				<div id="id01" class="w3-modal">
					<div class="w3-modal-content w3-card-4 w3-animate-zoom"
						style="padding: 50px; max-width: 350px">
						<h2 class="card-title text-center" style="color: #113366;">LOGIN</h2>
						<div class="card-body">
							<form class="form-signin" id="frm" name="frm" method="POST"
								onSubmit="logincall();return false" action="loginCheck.do">
								<h6 class="form-signin-heading">로그인 정보를 입력하세요</h6>
								<br> <label for="inputId" class="sr-only">Your ID</label> <input
									type="text" id="id" name="id" class="form-control"
									placeholder="Your ID" required autofocus><BR> <label
									for="inputPassword" class="sr-only">Password</label> <input
									type="password" id="pw" name="pw" class="form-control"
									placeholder="Password" required><br>
								<div class="checkbox">
									<label> <input type="checkbox" value="remember-me">
										기억하기
									</label>
								</div>
								<button class="w3-button w3-block w3-blue" type="submit">LOGIN</button>
								<button
									onclick="document.getElementById('id01').style.display='none'"
									type="button" class="w3-button w3-block w3-red">CLOSE</button>
							</form>
						</div>
					</div>
				</div>

				<br> <br> <br>
				<div class="w3-row-padding w3-grayscale"
					style="margin-bottom: 128px">
					<div class="w3-half">
						<img src="img/cherry.jpg" style="width: 100%"> <img
							src="img/beach.jpg" style="width: 100%"> <img
							src="img/the-night-sky.jpg" style="width: 100%">
					</div>
					<div class="w3-half">
						<img src="img/snowflakes.jpg" style="width: 100%"> <img
							src="img/moon.jpg" style="width: 100%"> <img
							src="img/flower.jpg" style="width: 100%">
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>
<jsp:include page="../common/tail.jsp"></jsp:include>