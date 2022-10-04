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

    <form action="#" class="login-form" id="checkPwForm">
        <div class="mypage_password">
            비밀번호를 입력해주세요
        </div>
        <div class="textb">
            <input type="password" class="form-control" placeholder="Password" id="pw">
        </div>
        <div class = "password_btn">
            <button class="btn" type="button" onclick="pwCheck()">확인</button>
        </div>
    </form>

    <div id="popSignOut" class="pop_wrap" style="display:none;">
		<div class="pop_inner">
  			<p class="dsc">로그아웃 하시겠습니까?</p>
  			<button type="button" class="btn_yes" onclick="location.href='../SignOutService'">예</button>
  			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
  		</div>
	</div>

    <script src="pop.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    // pop 닫기
	function closePop(){
		$('#popSignOut').css("display", "none");
	}
    
	// 회원정보 수정 시 정보 확인
	function pwCheck() {
		var pw = $("#pw").val();
		if ($("#pw").val() == '') {
			alert("Password 입력 필요");
			return;
		} else {
			pwCheckResult();
			return;
		}
	}
	function pwCheckResult() {
		$.ajax({
				type : "post",
				url : "../CheckPwToMyPageService",
				data : {
					'pw' : $("#pw").val()
				},
				dataType : "text",
				success : function(result) {
					var text = $('#checkPwForm');
					text.html("");
			if (result == "true" ) {
				location.href='../UserInfo/ReviseInfo.jsp';
			} else {
				text.html("<div class='mypage_password'>비밀번호를 입력해주세요</div>"
						+ "<div class='textb'>"
						+ "<div class='textb'>"
						+ "<input type='password' class='form-control' placeholder='Password' id='pw'>"
						+ "</div>"
						+ "<div class='password_btn'>"
						+ "<button type='submit' class='btn' id='btnCheckBtn' onclick='pwCheck()'>확인</button>"
						+ "</div>");
				alert("비밀번호가 틀렸습니다.")
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