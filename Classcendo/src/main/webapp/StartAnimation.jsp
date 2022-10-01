<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classcendo</title>
<link rel="stylesheet" href="StartAnimation.css">
<style>
body {
	background: url('./Image/StartAnimation.png') no-repeat center;
	background-size: cover;
	min-height: 100vh;
}
</style>
</head>
<body>
<p class="loading">C</p>
<script>
setTimeout(function() {
	window.location.href = "UserInfo/SignIn.jsp";
	}, 2000);
</script>
</body>
</html>