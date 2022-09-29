<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="MyPage.css">
    <!-- <link rel="stylesheet" href="pop.css"> -->
    <title>Document</title>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	%>
    <nav class="navbar">
        <div class="navbar__logo">
            <a href="../Student/Main.jsp">
                <image src="../Image/logo_white.png" width="160" height="24">
            </a>
        </div>
        <div class="navbar_center">
            안녕하세요 <%=info.getUserName()%>선생님 :)
        </div> 
        <ul class="navbar__menu">
            <li><a href="../UserInfo/MyPage.jsp">마이페이지</a></li>
            <li><a href="#popSignOut" class="btn_open">로그아웃</a></li>
        </ul>
    </nav>
    <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>

    <form action="student_record.html" class="login-form">
        <div class="mypage_password">
            학급을 생성해주세요
        </div>
        <div class="textb">
            <input type="text" class="form-control" placeholder="OOOO년 OO학년 OO반" id="srlName">
        </div>
        <div class = "password_btn">
            <button class="btn" type="submit">Add</button>
        </div>
    </form>

    <div id="popSignOut" class="pop_wrap" style="display:none;">
    		<div class="pop_inner">
      			<p class="dsc">정말 로그아웃 하시겠습니까?</p>
      			<button type="button" class="btn_yes" onclick="../SignOutService'">예</button>
      			<button type="button" class="btn_no" onclick="#">아니오</button>

    		</div>
    </div>

    <script src="pop.js"></script>
</body>
</html>