<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta charset="UTF-8">
<title>CodeTest</title>
</head>
<body>
	<!-- 회원가입 테스트 -->
	<form action="SignUpService" method="post">
		<input type="text" placeholder="Id" id="id" name="id" autofocus />
		<input type="password" placeholder="Password" id="pw" name="pw" />
		<input type="password" placeholder="PasswordCheck" id="pwCheck" name="pwCheck" />
		<input type="password" placeholder="Name" id="name" name="name" />
		<input type="text" placeholder="E-Mail" id="email" name="email" />
		<input type="submit" value="Sign up" class="btn">
	</form>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="LoginJoin.js"></script>
	<script type="text/javascript">
		// 아이디 중복 확인
		function idDuplicateCheck() {
			$.ajax({
				type : "post",
				url : "idDuplicateCheckService",
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
			var text = $('#idCheck');
			text.html("");
			if ($("#id").val() != '') {
				if (result == 'false') {
					text.html("사용 가능").css('color', 'green');
				} else {
					text.html("중복").css('color', 'red');
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
			var text = $('#pwCheckIcon');
			text.html("");
			if ($("#pwCheck").val() != '') {
				if (pw1 == pw2) {
					text.html("일치").css('color', 'green');
				} else {
					text.html("불일치").css('color', 'red');
				}
			}
		}
		
		// 이메일 중복 확인
		function emailDuplicateCheck() {
			$.ajax({
				type : "post",
				url : "emailDuplicateCheckService",
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
			var text = $('#emailCheck');
			text.html("");
			if ($("#email").val() != '') {
				if (result == 'false') {
					text.html("사용 가능").css('color', 'green');
				} else {
					text.html("중복").css('color', 'red');
				}
			}	
		}
		
		// 회원가입 시 정보 확인
		function signUpInfoCheck() {
			var cnt = 0
			if ($("#id").val() == '') cnt++;
			if (document.getElementById("idCheck").innerHTML != '사용 가능') cnt++;
			if ($("#pw1").val() == '') cnt++;
			if (document.getElementById("pwCheck").innerHTML != '일치') cnt++;
			if ($("#name").val() == '') cnt++;
			if ($("#email").val() == '') cnt++;
			if (document.getElementById("emailCheck").innerHTML != '사용 가능') cnt++;
			if (cnt == 7) <% // TODO 버튼 교체 %>
		}
	</script>
</body>
</html>
