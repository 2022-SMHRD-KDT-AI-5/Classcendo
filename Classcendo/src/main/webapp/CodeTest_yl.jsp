<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta charset="UTF-8">
<title>CodeTest</title>
</head>
<body>
<!-- 로그인 테스트 -->
	<form action="LoginService" method="post">
		<input type="text" placeholder="Id" name="id" autofocus />
		<input type="password" placeholder="Password" name="pw" />
		<input type="submit" value="Sign in" class="btn">
	</form>
</body>
</html>