<%@page import="Model.UserInfoDTO"%>
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
	<!-- �α��� �׽�Ʈ -->
	<form action="SignInService" method="post">
		<input type="text" placeholder="Id" name="id" autofocus /> <input
			type="password" placeholder="Password" name="pw" /> <input
			type="submit" value="Sign in" class="btn">
	</form>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	if (info != null) {
	%>
	<a href="SignOutService"><button>Logout</button></a>
	<a href="CodeTest_yl2.jsp"><button>��й�ȣȭ�뤤</button></a>
	<%
	}
	%>
</body>
</html>