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
    <script src="pop.js"></script>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	%>
    <nav class="navbar">
        <div class="navbar__logo">
            <a href="../Student/Main.jsp">
                <image src="../image/logo_white.png" width="160" height="24">
            </a>
        </div>

        <div class="navbar_center">
            �ȳ��ϼ��� <%=info.getUserName()%>������ :)
        </div> 
        <ul class="navbar__menu">
            <li><a href="../UserInfo/MyPage.jsp">����������</a></li>
            <li><a href="#popSignOut" class="btn_open">�α׾ƿ�</a></li>
        </ul>
    </nav>
        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>


        <div class="mypage_btn">
                <a href="../UserInfo/CheckPw.jsp" class="btn">������ ����</a>
                <a href="../Student/ReviseClass.jsp" class="btn">�б����� ����</a>
        </div>
        <div id="popSignOut" class="pop_wrap" style="display:none;">
    		<div class="pop_inner">
      			<p class="dsc">���� �α׾ƿ� �Ͻðڽ��ϱ�?</p>
      			<button type="button" class="btn_yes" onclick="../SignOutService'">��</button>
      			<button type="button" class="btn_no" onclick="#">�ƴϿ�</button>

    		</div>
        </div>


    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script src="pop.js"></script>

</body>
</html>