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
<!-- ȸ������ �׽�Ʈ -->
	<form action="SignUpService" method="post">
		<input type="text" placeholder="Id" name="id" autofocus />
		<input type="password" placeholder="Password" name="pw" />
		<input type="password" placeholder="PasswordCheck" name="pwCheck" />
		<input type="password" placeholder="Name" name="name" />
		<input type="text" placeholder="E-Mail" name="email" />
		<input type="submit" value="Sign up" class="btn">
	</form>
</body>
</html>