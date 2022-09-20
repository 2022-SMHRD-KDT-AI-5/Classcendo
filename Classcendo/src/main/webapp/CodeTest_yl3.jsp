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
				<input type="text" placeholder="Id" class="input" id="findPwId" autofocus/>
				<input type="text" placeholder="Name" class="input" id="findPwName"/>
				<input type="text" placeholder="Email" class="input" id="findPwEmail"/>
				<input type="button" value="Find" class="btn" onclick="FindPwCheck()">
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
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="FindIdPw.js"></script>
	<script type="text/javascript">
	
	// 비밀번호 찾기 입력 정보 확인
	function FindPwCheck(){
		if($("#findPwId").val() == ''){
			alert("ID를 입력하세요");
			return;
		}else if($("#findPwName").val() == ''){
			alert("Name을 입력하세요");
			return;
		}else if ($("#findPwEmail").val() == ''){
			alert("Email을 입력하세요");
			return;
		}else{
			FindPw();
		}
	}
	
	// 비밀번호 찾기
	function FindPw() {
		$.ajax({
			type : "post",
			url : "FindPwService",
			data : {'id' : $("#findPwId").val(),
					'name' : $("#findPwName").val(),
					'email' : $("#findPwEmail").val()},

			dataType : "text",		
			
			success : function(idCheck) {
				FindPwChange(idCheck);
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	<%
	// TODO html, 연결페이지 변경 필요
	%>
	// 비밀번호 찾기 후 변경 
	function FindPwChange(idCheck){
		var text = $('#form4');
		text.html("");
		if(idCheck != 'null'){
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
						+ "</tr>"
						+ "</table>");
		}else{
			text.html("<h5 class='input'>존재하지 않는 회원입니다</h5>"
					+ "<a href='SignUp.jsp' class='link'>Find info</a>");
		}
	}
	
	// 비밀번호 변경 입력 정보 확인
	function RevisePwCheck(){
		if(document.getElementById("pwcheck").innerHTML != '일치'){
			alert('PW를 확인하세요');
			return;
		}else{
			RevisePw();
		}
	}
	
	// 비밀번호 변경 완료
	function RevisePw(){
		$.ajax({
			type : "post",
			url : "RevisePwService",
			data : {'pw1' : $("#pw1").val(),
					'pw2' : $("#pw2").val()},

			success : function(result) {
				if(result == 'true'){
					RevisePwComplete(result);
				}else {
					return;
				}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}

	// 비밀번호 변경 완료 html
	function RevisePwComplete(result){
		var text = $('#form4');
		text.html("");
		if(result == 'true'){
			text.html("<h5 class='input'>Revise Pw Success</h5>"
					 + "<a href='LoginJoin.jsp' class='link'>Sign in/Sign up</a>");
		}else{
			return;
		}
	}
	
	// 비밀번호 확인
	function PwCall() {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;
		PwCheck(pw1, pw2);
	}

	// 비밀번호 확인 완료
	function PwCheck(pw1, pw2) {
		var text = $('#pwcheck');
		text.html("");
		if($("#pw2").val() != ''){
			if (pw1 == pw2) {
				text.html("일치").css('color', 'green');
			} else {
				text.html("불일치").css('color', 'red');
			}
		}
	}
	

	</script>


</body>
</html>