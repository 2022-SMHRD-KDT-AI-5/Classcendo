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
    <style>
        body{
            background: url('../image/mypage3bg.png') no-repeat center;
            background-size: cover;
        }
    </style>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
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
            <li>
                <a href="#popSignOut" class="btn_open">�α׾ƿ�</a>
            </li>
        </ul>
    </nav>
    <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>

    <form class="login-form2">
        <!-- action="student_record.html" -->
        <table class="jointable">
            <tr>
                <td class="textb_2">
                    Employee Number
                    <input type="text" class="form-control" placeholder="Employee Number" id="id">
                </td>
            </tr>
            <tr>
                <td class="textb_2">
                    Password
                    <input type="password" class="form-control" placeholder="Password" id="pw">
                </td>
            </tr>
            <tr> 
                <td class="textb_2">
                    Password Check
                    <input type="password" class="form-control" placeholder="Password Check" id="pwCheck">
                </td>
            </tr>
            <tr> 
                <td class="textb_2">
                    Name
                    <input type="text" class="form-control" placeholder="Name" id="name">
                </td>
            </tr>
            <tr> 
                <td class="textb_2">
                    E-Mail
                    <input type="email" class="form-control" placeholder="E-Mail" id="email">
                </td>
            </tr>
            <tr>
                <td class="textb_2">
                    <button class="btn btn-primary" type="button" onclick="location.href='login.html'">Revise</button>
                    <button class="btn btn-primary" type="button" onclick="location.href='#pop_info_2'">Membership Withdrawal</button>
                </td>
            </tr>
        </table>
    </form>    
    <div id="popSignOut" class="pop_wrap" style="display:none;">
    		<div class="pop_inner">
      			<p class="dsc">���� �α׾ƿ� �Ͻðڽ��ϱ�?</p>
      			<button type="button" class="btn_yes" onclick="../SignOutService'">��</button>
      			<button type="button" class="btn_no" onclick="#">�ƴϿ�</button>

    		</div>
    </div>
    <script src="../Student/main.js"></script>
    <script src="pop.js"></script>
</body>
</html>