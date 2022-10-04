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

    <form action="#" class="login-form" id="checkPwForm">
        <div class="mypage_password">
            ��й�ȣ�� �Է����ּ���
        </div>
        <div class="textb">
            <input type="password" class="form-control" placeholder="Password" id="pw">
        </div>
        <div class = "password_btn">
            <button class="btn" type="button" onclick="pwCheck()">Ȯ��</button>
        </div>
    </form>

    <div id="popSignOut" class="pop_wrap" style="display:none;">
		<div class="pop_inner">
  			<p class="dsc">�α׾ƿ� �Ͻðڽ��ϱ�?</p>
  			<button type="button" class="btn_yes" onclick="location.href='../SignOutService'">��</button>
  			<button type="button" class="btn_no" onclick="closePop()">�ƴϿ�</button>
  		</div>
	</div>

    <script src="pop.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    // pop �ݱ�
	function closePop(){
		$('#popSignOut').css("display", "none");
	}
    
	// ȸ������ ���� �� ���� Ȯ��
	function pwCheck() {
		var pw = $("#pw").val();
		if ($("#pw").val() == '') {
			alert("Password �Է� �ʿ�");
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
				text.html("<div class='mypage_password'>��й�ȣ�� �Է����ּ���</div>"
						+ "<div class='textb'>"
						+ "<div class='textb'>"
						+ "<input type='password' class='form-control' placeholder='Password' id='pw'>"
						+ "</div>"
						+ "<div class='password_btn'>"
						+ "<button type='submit' class='btn' id='btnCheckBtn' onclick='pwCheck()'>Ȯ��</button>"
						+ "</div>");
				alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.")
				}
			},
			error : function(e) {
				alert("��û����");
			}
				
		});
	}
	
    </script>
</body>
</html>