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
                <h2>비밀번호 확인</h2>
                <p>고객님의 개인정보 보호를 위해 본인확인을 진행합니다<br>
                <strong>비밀번호</strong>를 입력해주세요</p>
                <div class="check">
                    <span>비밀번호 확인</span>
                    <input type="password" name="pw" class="pw" placeholder="Pw">
                    <button value="submit" type="submit" class="btn">확인</button>
                </div>
            </div>
        </div>
        </form>

</body>
</html>