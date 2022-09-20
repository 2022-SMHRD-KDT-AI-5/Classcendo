<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link href="SignIn.css" rel="stylesheet">
<link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	rel="stylesheet">
<style>
body {
	background: url('../Image/join_back.png') no-repeat center;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<form action="#" class="login-form" id="signUpForm">
		<img src="../Image/logo_green.png" width="500" height="65"><br><br>
		<table>
			<tr>
				<td class="textb">
					<input type="text" class="form-control"	id="id" placeholder="EMPLOYEE NUMBER" onkeyup="idDuplicateCheck()">
				</td>
				<td>
					<img src="../Image/check1.png" class="img_check1" id="idCheckIcon">
				</td>
			</tr>
			<tr>
				<td class="textb">
					<input type="password" class="form-control"	id="pw" placeholder="PASSWORD" onkeyup="pwEqualCheck()">
				</td>
			</tr>
			<tr>
				<td class="textb">
					<input type="password" class="form-control"	id="pwCheck" placeholder="PASSWORD CHECK" onkeyup="pwEqualCheck()">
				</td>
				<td>
					<img src="../Image/check1.png" class="img_check1" id="pwCheckIcon">
				</td>
			</tr>
			<tr>
				<td class="textb">
					<input type="text" class="form-control" id="name" placeholder="TEACHER NAME" onkeyup="nameCheck()">
				</td>
			</tr>
			<tr>
				<td class="textb">
					<input type="email" class="form-control" id="email" placeholder="E-MAIL" onkeyup="emailDuplicateCheck()">
				</td>
				<td>
					<img src="../Image/check1.png" class="img_check1" id="emailCheckIcon">
				</td>
			</tr>
			<tr>
				<td class="d-grid gap-2 d-md-block">
					<button class="btn btn-primary" type="button" id="signUpBtn" onclick="signUpInfoCheck()">JOIN</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">

		// 아이디 중복 확인
		function idDuplicateCheck() {
			$.ajax({
				type : "post",
				url : "../IdDuplicateCheckService",
				data : {
					'id' : $("#id").val()
				},
				success : function(result) {
					idDuplicateCheckResult(result);
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}
		
		// 아이디 중복 확인 결과
		function idDuplicateCheckResult(result) {
			var icon = $('#idCheckIcon');
			if ($("#id").val() != '') {
				if (result == 'false') {
					icon.attr('src', '../Image/check2.png');
				} else {
					icon.attr('src', '../Image/check1.png');
				}
			}
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
		
		// 회원가입 시 정보 확인
		function signUpInfoCheck() {
 			if (document.getElementById("idCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Id 확인 필요");
				return;
			} else if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Password 확인 필요");
				return;
			} else if ($("#name").val() == '') {
				alert("Name 확인 필요");
				return;
			} else if (document.getElementById("emailCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("E-Mail 확인 필요");
				return;
			} else{
				signUpInfoCheckResult()
				return;
			}
		}
		
		// 회원가입 시 정보 확인 결과
		function signUpInfoCheckResult(){
			$.ajax({
				type : "post",
				url : "../SignUpService",
				data : {
					'id' : $("#id").val(),
					'pw' : $("#pw").val(),
					'name' : $("#name").val(),
					'email' : $("#email").val()
				},
				success : function(result) {
					var text = $('#signUpForm');
					text.html("");
					<% // TODO HTML 수정 필요 회원가입 성공 메시지 및 로그인 창으로 이동하는 버튼 %>
					if (result == 'true') {
						text.html("<h2 class='form__title'>Find Password Success</h2>"
										+ "<table>"
										+ "<tr>"
										+ "<td colspan='2'><input type='password' placeholder='New Pw' class='input' id='pw1' autofocus/></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td><input type='password' placeholder='New Pw Check' class='input' id='pw2' onkeyup='PwCall()' /></td>"
										+ "<td id='pwcheck' align='center'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td colspan='2' align='center'><input type='button' value='Revise' class='btn' onclick='RevisePwCheck()'></td>"
										+ "</tr>" + "</table>");
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