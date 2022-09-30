<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background: url('../Image/mypage3bg.png') no-repeat center;
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
            <a href="../Student/ReviseStudentRecord.jsp">
                <image src="../Image/logo_white.png" width="160" height="24">
            </a>
        </div>

        <div class="navbar_center">
            안녕하세요 <%=info.getUserName()%>선생님 :)
        </div> 
        <ul class="navbar__menu">
            <li><a href="../UserInfo/MyPage.jsp">마이페이지</a></li>
            <li>
                <a href="#popSignOut" class="btn_open">로그아웃</a>
            </li>
        </ul>
    </nav>
    <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>

    <form class="login-form2" id="reviseInfoForm">
        <!-- action="student_record.html" -->
        <table class="jointable">
            <tr>
                <td class="textb_2">
                    Employee Number
                    <div class="form-control2"><%=info.getUserNum() %></div>
                </td>
            </tr>
            <tr>
                <td class="textb_2">
                    Password
                    <input type="password" class="form-control" placeholder="Password" id="pw" onkeyup="pwEqualCheck()">
                </td>
            </tr>
            <tr> 
                <td class="textb_2">
                    Password Check
                    <input type="password" class="form-control" placeholder="Password Check" id="pwCheck" onkeyup="pwEqualCheck()">
                </td>
                <td>
					<img src="../Image/check1.png" class="img_check1" id="pwCheckIcon">
				</td>
            </tr>
            <tr> 
                <td class="textb_2">
                    Name
                    <input type="text" class="form-control" placeholder="Name" id="name" onkeyup="nameCheck()">
                </td>
            </tr>
            <tr> 
                <td class="textb_2">
                    E-Mail
                    <input type="email" class="form-control" placeholder="E-Mail" id="email" onkeyup="emailDuplicateCheck()">
                </td>
                <td>
					<img src="../Image/check1.png" class="img_check1" id="emailCheckIcon">
				</td>
            </tr>
            <tr>
                <td class="textb_2">
                    <button class="btn btn-primary" type="button" id="reviseInfoBtn" onclick="reviseInfo()">수정</button>
                    <button class="btn btn-primary" type="button" onclick="location.href='#popWithdrawal'">탈퇴</button>
                </td>
            </tr>
        </table>
    </form>    
    <div id="popSignOut" class="pop_wrap" style="display:none;">
		<div class="pop_inner">
  			<p class="dsc">로그아웃 하시겠습니까?</p>
  			<button type="button" class="btn_yes" onclick="location.href='../SignOutService'">예</button>
  			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
  		</div>
	</div>
	<div id="popReviseInfo" class="pop_wrap" style="display:none;"> 
        <div class="pop_inner">
          <p class="dsc">회원정보가 변경 되었습니다.</p>
          <button type="button" class="btn_yes" onclick="location.href='../UserInfo/ReviseInfo.jsp'">확인</button>
        </div>
    </div>  
	<div id="popWithdrawal" class="pop_wrap" style="display:none;"> 
        <div class="pop_inner">
          <p class="dsc">정말 탈퇴 하시겠습니까?</p>
          <button type="button" class="btn_yes" onclick="location.href='login.html'">예</button>
          <button type="button" class="btn_no" onclick="location.href='mypage_3.html'">아니오</button>
        </div>
    </div>
    <script src="../Student/main.js"></script>
    <script src="pop.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
	 // pop 닫기
	function closePop(){
		$('#popSignOut').css("display", "none");
	}
	
	// 비밀번호 확인
	function pwEqualCheck() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		pwEqualCheckResult(pw, pwCheck);
	}
	
	// 비밀번호 확인 결과
	function pwEqualCheckResult(pw, pwCheck) {
		var icon = $('#pwCheckIcon');
		if ($("#pwCheck").val() != '') {
			if (pw == pwCheck) {
				icon.attr('src', '../Image/check2.png');
			} else {
				icon.attr('src', '../Image/check1.png');
			}
		}
	}
	
	// 이메일 중복 확인
	function emailDuplicateCheck() {
		$.ajax({
			type : "post",
			url : "../EmailDuplicateCheckService",
			data : {
				'email' : $("#email").val()
			},
			success : function(result) {
				emailDuplicateCheckResult(result);
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	
	// 이메일 중복 확인 결과
	function emailDuplicateCheckResult(result) {
		var icon = $('#emailCheckIcon');
		if ($("#email").val() != '') {
			if (result == 'false') {
				icon.attr('src', '../Image/check2.png');
			} else {
				icon.attr('src', '../Image/check1.png');
			}
		}
	}

	// 비밀번호 확인 후 회원정보 변경 시 비밀번호 확인
	function reviseInfo() {
			if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
			alert("Password 확인 필요");
			return;
		} else{
			reviseInfoResult()
			return;
		}
	}

	// 회원정보 수정 버튼
	function reviseInfoResult() {
		$.ajax({
			type : "post",
			url : "../ReviseInfoService",
			data : {
				'pw' : $("#pw").val(),
				'name' : $("#name").val(),
				'email' : $("#email").val()
			},
			success : function(result) {
				<% // TODO HTML 수정 필요 회원 정보 변경 성공 text와 로그인 창으로 이동하는 버튼%>
				if (result == 'true') {
					document.querySelector('#popReviseInfo').style.display ='block';  
					}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
    
    </script>
</body>
</html>