<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	%>
<form action="InfoPwCheckService" method="post">
        <div class="container">
            <div class="contents">
                <h2>��й�ȣ Ȯ��</h2>
                <p>������ �������� ��ȣ�� ���� ����Ȯ���� �����մϴ�<br>
                <strong>��й�ȣ</strong>�� �Է����ּ���</p>
                <div class="check">
                    <span>��й�ȣ Ȯ��</span>
                    <input type="password" name="pw" class="pw" placeholder="Pw">
                    <button value="submit" type="submit" class="btn">Ȯ��</button>
                </div>
            </div>
        </div>
        </form>

</body>
</html>