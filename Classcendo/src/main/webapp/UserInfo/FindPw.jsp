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
	
		// 비밀번호 찾기 시 정보 확인
		function findPwCheck() {
				if ($("#id").val() == '') {
				alert("Employee Number 입력 필요");
				return;
			} else if ($("#name").val() == '') {
				alert("Name 입력 필요");
				return;
			} else if ($("#email").val() == '') {
				alert("Email 입력 필요");
				return;
			} else{
				findPwCheckResult()
				return;
			}
		}

		// 비밀번호 찾기 결과
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
					<% // TODO HTML 수정 필요 table로 수정 필요 => pwCheckIcon 담을 테이블임..%>
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
						alert("존재하지 않는 정보")
					}
				},
				error : function(e) {
					alert("요청실패");
				}
			});
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

		// 비밀번호 찾기 후 비밀번호 변경 시 정보 확인
		function revisePwToFindPw() {
 			if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Password 확인 필요");
				return;
			} else{
				revisePwToFindPwResult()
				return;
			}
		}

		// 비밀번호 변경 버튼
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
					<% // TODO HTML 수정 필요 비밀번호 변경 성공 text와 로그인 창으로 이동하는 버튼%>
					if (result == 'true') {
						text.html("<h5 class='input'>Revise Pw Success</h5>"
										+ "<a href='Signin.jsp' class='link'>Sign in/Sign up</a>");
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
</html>