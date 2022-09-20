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
	
	// ��й�ȣ ã�� �Է� ���� Ȯ��
	function FindPwCheck(){
		if($("#findPwId").val() == ''){
			alert("ID�� �Է��ϼ���");
			return;
		}else if($("#findPwName").val() == ''){
			alert("Name�� �Է��ϼ���");
			return;
		}else if ($("#findPwEmail").val() == ''){
			alert("Email�� �Է��ϼ���");
			return;
		}else{
			FindPw();
		}
	}
	
	// ��й�ȣ ã��
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
				alert("��û����");
			}
		});
	}
	<%
	// TODO html, ���������� ���� �ʿ�
	%>
	// ��й�ȣ ã�� �� ���� 
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
			text.html("<h5 class='input'>�������� �ʴ� ȸ���Դϴ�</h5>"
					+ "<a href='SignUp.jsp' class='link'>Find info</a>");
		}
	}
	
	// ��й�ȣ ���� �Է� ���� Ȯ��
	function RevisePwCheck(){
		if(document.getElementById("pwcheck").innerHTML != '��ġ'){
			alert('PW�� Ȯ���ϼ���');
			return;
		}else{
			RevisePw();
		}
	}
	
	// ��й�ȣ ���� �Ϸ�
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
				alert("��û����");
			}
		});
	}

	// ��й�ȣ ���� �Ϸ� html
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
	
	// ��й�ȣ Ȯ��
	function PwCall() {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;
		PwCheck(pw1, pw2);
	}

	// ��й�ȣ Ȯ�� �Ϸ�
	function PwCheck(pw1, pw2) {
		var text = $('#pwcheck');
		text.html("");
		if($("#pw2").val() != ''){
			if (pw1 == pw2) {
				text.html("��ġ").css('color', 'green');
			} else {
				text.html("����ġ").css('color', 'red');
			}
		}
	}
	

	</script>


</body>
</html>