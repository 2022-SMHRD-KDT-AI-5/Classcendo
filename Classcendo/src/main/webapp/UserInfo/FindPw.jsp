<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="SignIn.css" rel="stylesheet">
<link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	rel="stylesheet">
<style>
body {
	background: url('../Image/passwordbg.png') no-repeat center;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<form action="#" class="login-form" id="findPwForm">
		<img src='../Image/logo_white.png' alt='' width='500' height='65'><br><br>
		<div class='textb'>
			<input type='text' class='form-control' id='id' placeholder='Employee Number'>
		</div>
		<div class='textb'>
			<input type='text' class='form-control' id='name' placeholder='User Name'>
		</div>
		<div class='textb'>
			<input type='email' class='form-control' id='email' placeholder='E-mail'>
		</div>
		<div class='Passwordbtn'>
			<button type='button' class='btnfind' id='btnFindBtn' onclick='findPwCheck()'>Find</button>
		</div>
	</form>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		// ��й�ȣ ã�� �� ���� Ȯ��
		function findPwCheck() {
				if ($("#id").val() == '') {
				alert("Employee Number �Է� �ʿ�");
				return;
			} else if ($("#name").val() == '') {
				alert("Name �Է� �ʿ�");
				return;
			} else if ($("#email").val() == '') {
				alert("Email �Է� �ʿ�");
				return;
			} else{
				findPwCheckResult()
				return;
			}
		}

		// ��й�ȣ ã�� ���
		function findPwCheckResult() {
			$.ajax({
				type : "post",
				url : "../FindPwService",
				data : {
					'id' : $("#id").val(),
					'name' : $("#name").val(),
					'email' : $("#email").val()
				},
				dataType : "text",
				success : function(idCheck) {
					var text = $('#findPwForm');
					text.html("");
					<% // TODO HTML ���� �ʿ� table�� ���� �ʿ� => pwCheckIcon ���� ���̺���..%>
					if (idCheck != 'null') {
						text.html("<img src='../Image/logo_white.png' alt='' width='500' height='65'><br>"
										+ "<br>"
										+ "<div class='textb'>"
										+ "<input type='password' class='form-control' id='pw' placeholder='New Password' onkeyup='pwEqualCheck()'>"
										+ "</div>"
										+ "<div class='textb'>"
										+ "<input type='password' class='form-control' id='pwCheck' placeholder='New Password Confirm' onkeyup='pwEqualCheck()'>"
										+ "</div>"
										+ "<img src='../Image/check1.png' class='img_check1' id='pwCheckIcon'>"
										+ "<div class='Passwordbtn'>"
										+ "<button type='button' class='btnfind'id='revisePwBtn' onclick='revisePwToFindPw()'>Revise</button>"
										+ "</div>");
					} else {
						text.html("<img src='../Image/logo_white.png' alt='' width='500' height='65'><br>"
								+ "<br>"
								+ "<div class='textb'>"
								+ "<input type='text' class='form-control' id='id' placeholder='Employee Number'>"
								+ "</div>"
								+ "<div class='textb'>"
								+ "<input type='text' class='form-control' id='name' placeholder='User Name'>"
								+ "</div>"
								+ "<div class='textb'>"
								+ "<input type='email' class='form-control' id='email' placeholder='E-mail'>"
								+ "</div>"
								+ "<div class='Passwordbtn'>"
								+ "<button type='button' class='btnfind' id='btnFindBtn' onclick='findPwCheck()'>Find</button>"
								+ "</div>");
						alert("�������� �ʴ� ����")
					}
				},
				error : function(e) {
					alert("��û����");
				}
			});
		}

		// ��й�ȣ Ȯ��
		function pwEqualCheck() {
			var pw = document.getElementById("pw").value;
			var pwCheck = document.getElementById("pwCheck").value;
			pwEqualCheckResult(pw, pwCheck);
		}
		
		// ��й�ȣ Ȯ�� ���
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

		// ��й�ȣ ã�� �� ��й�ȣ ���� �� ���� Ȯ��
		function revisePwToFindPw() {
 			if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Password Ȯ�� �ʿ�");
				return;
			} else{
				revisePwToFindPwResult()
				return;
			}
		}

		// ��й�ȣ ���� ��ư
		function revisePwToFindPwResult() {
			$.ajax({
				type : "post",
				url : "../RevisePwToFindPwService",
				data : {
					'pw' : $("#pw").val(),
					'pwCheck' : $("#pwCheck").val()
				},
				success : function(result) {
					var text = $('#findPwForm');
					text.html("");
					<% // TODO HTML ���� �ʿ� ��й�ȣ ���� ���� text�� �α��� â���� �̵��ϴ� ��ư%>
					if (result == 'true') {
						text.html("<h5 class='input'>Revise Pw Success</h5>"
										+ "<a href='Signin.jsp' class='link'>Sign in/Sign up</a>");
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
</html>