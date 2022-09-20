<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="container__form container--findpw">
		<form action="FindPwService" class="form" id="form4" method="post">
			<h2 class="form__title">Find Password</h2>
			<input type="text" placeholder="Id" class="input" id="findPwId"
				autofocus /> <input type="text" placeholder="Name" class="input"
				id="findPwName" /> <input type="text" placeholder="Email"
				class="input" id="findPwEmail" /> <input type="button" value="Find"
				class="btn" onclick="FindPwCheck()">
		</form>
	</div>

	<!-- Overlay -->
	<div class="container__overlay">
		<div class="overlay">
			<div class="overlay__panel overlay--right">
				<button class="btn" id="findPw">Find Password</button>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="FindIdPw.js"></script>
	<script type="text/javascript">
		// 비밀번호 찾기 입력 정보 확인
		function findPwCheck() {
			var cnt = 0;
			if ($("#idTofindPw").val() == '') cnt++;
			if ($("#nameTofindPw").val() == '') cnt++;
			if ($("#emailTofindPw").val() == '') cnt++;
			if (cnt == 3) <% // TODO 버튼 교체 %>
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
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}
		
		<% // TODO html, 연결페이지 변경 필요%>
		// 비밀번호 찾기 후 HTML 변경
		function revisePwToFindPw(idCheck) {
			var text = $('#form4');
			text.html("");
			if (idCheck != 'null') {
				text
						.html("<h2 class='form__title'>Find Password Success</h2>"
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
			} else {
				text.html("<h5 class='input'>존재하지 않는 회원입니다</h5>"
						+ "<a href='SignUp.jsp' class='link'>Find info</a>");
			}
		}
		
		// 비밀번호 확인
		function pwEqualCheck() {
			var pw1 = document.getElementById("pw").value;
			var pw2 = document.getElementById("pwCheck").value;
			pwEqualCheckResult(pw, pwCheck);
		}

		// 비밀번호 확인 완료
		function pwEqualCheckResult(pw, pwCheck) {
			var text = $('#pwCheckIcon');
			text.html("");
			if ($("#pwCheck").val() != '') {
				if (pw == pwCheck) {
					text.html("일치").css('color', 'green');
				} else {
					text.html("불일치").css('color', 'red');
				}
			}
		}

		// 비밀번호 변경 입력 정보 확인
		function pwCheckToFindPw() {
			if (document.getElementById("pwCheck").innerHTML != '일치') <% // TODO 버튼 교체 %>
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
			var text = $('#form4');
			text.html("");
			if (result == 'true') {
				text
						.html("<h5 class='input'>Revise Pw Success</h5>"
								+ "<a href='LoginJoin.jsp' class='link'>Sign in/Sign up</a>");
			} else {
				return;
			}
		}
	</script>
	
</body>
</html>