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
	background: url('../Image/join_back.png') no-repeat center;
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
		<img src="../Image/logo_green.png" width="500" height="65"><br>
		<br>
		<table>
			<tr>
				<td class="textb"><input type="text" class="form-control"
					id="1" placeholder="EMPLOYEE NUMBER"></td>
				<td><img src="../Image/check1.png" class="img_check1"></td>
			</tr>
			<tr>
				<td class="textb"><input type="password" class="form-control"
					id="2" placeholder="PASSWORD"></td>
				<td><img src="../Image/check1.png" class="img_check1"></td>
			</tr>

			<tr>
				<td class="textb"><input type="password" class="form-control"
					id="3" placeholder="PASSWORD CHECK"></td>
			</tr>

			<tr>
				<td class="textb"><input type="text" class="form-control"
					id="4" placeholder="TEACHER NAME"></td>
			</tr>

			<tr>
				<td class="textb"><input type="email" class="form-control"
					id="floatingInput" placeholder="E-MAIL"></td>
				<td><img src="../Image/check1.png" class="img_check1"></td>
				<!-- 중복검사하면 이미지 경로 <img src="./Image/check2.png" class="img_check2"> 로 바꾸기 -->
			</tr>
			<tr>
				<td class="d-grid gap-2 d-md-block">
					<button class="btn btn-primary" type="submit">JOIN</button>
				</td>
			</tr>
		</table>
	</form>
	<script src="assets/js/main.js"></script>
</body>
</html>