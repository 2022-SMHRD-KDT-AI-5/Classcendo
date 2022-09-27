<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background: url('../Image/login_back.png') no-repeat center;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<form action="../SignInService" class="login-form">
		<img src="../Image/logo_green.png" alt="" width="500" height="65"><br>
		<br>

		<div class="textb">
			<input type="text" class="form-control" id="floatingInput" name="id"
				placeholder="Employee Number">
		</div>

		<div class="textb">
			<input type="password" class="form-control" id="floatingInput" name="pw"
				placeholder="Password">
		</div> 

		<div class="d-grid gap-2 d-md-block">
			<button class="btn btn-primary" type="submit">Login</button>
		</div>
		
		<div class="JoinPassbtn">
			<button type="button" onclick="location.href='SignUp.jsp'" class="btn1">Join</button>
			<button type="button" onclick="location.href='FindPw.jsp'"
				class="btn1">Find Your password</button>
		</div>
	</form>
	<script src="assets/js/main.js"></script>
</body>
</html>