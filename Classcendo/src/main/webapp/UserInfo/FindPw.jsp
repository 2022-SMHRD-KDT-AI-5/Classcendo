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
	<form action="../FindPwService" class="login-form" id = "findPwFrom">
		<img src="../Image/logo_white.png" width="500" height="65"><br>
		<br>

		<div class="textb">
			<input type="text" class="form-control" id="nameTofindPw" placeholder="User Name" >
		</div>

		<div class="textb">
			<input type="text" class="form-control" id="idTofindPw" placeholder="Employee Number">
		</div>

		<div class="textb">
			<input type="email" class="form-control" id="emailTofindPw" placeholder="E-mail">
		</div>

		<div class="Passwordbtn">
			<input type = "submit" class ="btnfind" id = "btnFind" value = "Find" onclick = "findPw()">
			<!-- <button class="btnfind" type="button" onclick="location.href='RevisePwToFindPw.jsp'">Find</button> -->
		</div>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	
	// 비밀번호 찾기 입력 정보 확인
	function findPwCheck() {
			var cnt = 0;
			if ($("#idTofindPw").val() == '') cnt++;
			if ($("#nameTofindPw").val() == '') cnt++;
			if ($("#emailTofindPw").val() == '') cnt++;
			if (cnt == 3) <% // TODO 버튼 교체 %>
		}

	// 비밀번호 찾기 입력 정보 확인
	function findPwCheck(){
		if($("#idTofindPw").val() == ''){
			alert("ID를 입력하세요");
			return;
		}else if($("#nameTofindPw").val() == ''){
			alert("Name을 입력하세요");
			return;
		}else if ($("#emailTofindPw").val() == ''){
			alert("Email을 입력하세요");
			return;
		}else{
			findPw();
		}
	}
		

		// 비밀번호 찾기
		function findPw() {
			$.ajax({
				type : "post",
				url : "FindPwService",
				data : {
					'id' : $("#idTofindPw").val(),
					'name' : $("#nameTofindPw").val(),
					'email' : $("#emailTofindPw").val()
				},
				dataType : "text",
				success : function(idCheck) {
					revisePwToFindPw(idCheck);
					alert("idcheck");
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}
	<% // TODO html, 연결페이지 변경 필요%>
		// 비밀번호 찾기 후 HTML 변경
		function revisePwToFindPw(idCheck) {
			var text = $('#findPwForm');
			text.html("");
			if (idCheck != 'null') {
				text
						.html("<form action='../RevisePwToFindPwService' class='login-form' id = 'RevisePwForm'>"
								+ "<img src='../Image/logo_white.png' alt='' width='500' height='65'><br>"
								+ "<br>"
								+ "<div class='textb'>"
								+ "<input type='password' class='form-control' id='pw' placeholder='New Password' onkeyup = 'pwEqualCheck'>"
								+ "</div>"
								+ "<div class='textb'>"
								+ "<input type='password' class='form-control' id='pwCheck' placeholder='New Password Confirm' onkeyup = 'pwEqualCheck'>"
								+ "</div>"
								+ "<div class='Passwordbtn'>"
								+ "<input type = 'submit' class = 'btnfind' value = 'Check'>"
								+ "</div>"
								+ "</form>");
			} else {
				text.html("<h5 class='input'>존재하지 않는 회원입니다</h5>"
						+ "<a href='SignUp.jsp' class='link'>Find info</a>");
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

		// 비밀번호 변경 입력 정보 확인
		function pwCheckToFindPw() {
			if (document.getElementById("pwCheck").innerHTML != "일치") <% // TODO 버튼 교체 %>
		}

		// 비밀번호 변경 버튼
		function revisePwToFindPw() {
			$.ajax({
				type : "post",
				url : "RevisePwToFindPwService",
				data : {
					'pw' : $("#pw").val(),
					'pwCheck' : $("#pwCheck").val()
				},
				success : function(result) {
					if (result == 'true') {
						revisePwCompleteToFindPw(result);
					} else {
						return;
					}
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}

		<% // TODO html, 연결페이지 변경 필요%>
		// 비밀번호 변경 완료 HTML
		function revisePwCompleteToFindPw(result) {
			var text = $('#RevisePwForm');
			text.html("");
			if (result == 'true') {
				text
						.html("<h5 class='input'>Revise Pw Success</h5>"
								+ "<a href='Signin.jsp' class='link'>Sign in/Sign up</a>");
			} else {
				return;
			}
		}
	</script>
</body>
</html>
</html>