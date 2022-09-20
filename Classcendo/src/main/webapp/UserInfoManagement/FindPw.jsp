<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="SignIn.css" rel="stylesheet">
<link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	rel="stylesheet">
<style>
body {
	background: url('../Image/passwordbg.png') no-repeat center;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<form action="Student_record.html" class="login-form">
		<img src="../Image/logo_white.png" width="500" height="65"><br>
		<br>

		<div class="textb">
			<input type="email" class="form-control" id="floatingInput"
				placeholder="User Name">
		</div>

		<div class="textb">
			<input type="email" class="form-control" id="floatingInput"
				placeholder="Employee Number">
		</div>

		<div class="textb">
			<input type="email" class="form-control" id="floatingInput"
				placeholder="E-mail">
		</div>

		<div class="Passwordbtn">
			<button class="btnfind" type="button"
				onclick="location.href='RevisePwToFindPw.jsp'">Find</button>
		</div>
	</form>
	<script src="assets/js/main.js"></script>
</body>
</html>
</html>