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
	<!-- ȸ������ �׽�Ʈ -->
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
		// ���̵� �ߺ� Ȯ��
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
					alert("��û����");
				}
			});
		}
		
		// ���̵� �ߺ� Ȯ�� ���
		function idDuplicateCheckResult(result) {
			var text = $('#idCheck');
			text.html("");
			if ($("#id").val() != '') {
				if (result == 'false') {
					text.html("��� ����").css('color', 'green');
				} else {
					text.html("�ߺ�").css('color', 'red');
				}
			}
		}
		
		// ��й�ȣ Ȯ��
		function pwEqualCheck() {
			var pw = document.getElementById("pw").value;
			var pwCheck = document.getElementById("pwCheck").value;
			pwEqualCheckResult(pw, pwCheck);
		}
		
		// ��й�ȣ Ȯ�� ���
		function pwEqualCheckResult(pw, pwCheck) {
			var text = $('#pwCheckIcon');
			text.html("");
			if ($("#pwCheck").val() != '') {
				if (pw1 == pw2) {
					text.html("��ġ").css('color', 'green');
				} else {
					text.html("����ġ").css('color', 'red');
				}
			}
		}
		
		// �̸��� �ߺ� Ȯ��
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
					alert("��û����");
				}
			});
		}
		
		// �̸��� �ߺ� Ȯ�� ���
		function emailDuplicateCheckResult(result) {
			var text = $('#emailCheck');
			text.html("");
			if ($("#email").val() != '') {
				if (result == 'false') {
					text.html("��� ����").css('color', 'green');
				} else {
					text.html("�ߺ�").css('color', 'red');
				}
			}	
		}
		
		// ȸ������ �� ���� Ȯ��
		function signUpInfoCheck() {
			var cnt = 0
			if ($("#id").val() == '') cnt++;
			if (document.getElementById("idCheck").innerHTML != '��� ����') cnt++;
			if ($("#pw1").val() == '') cnt++;
			if (document.getElementById("pwCheck").innerHTML != '��ġ') cnt++;
			if ($("#name").val() == '') cnt++;
			if ($("#email").val() == '') cnt++;
			if (document.getElementById("emailCheck").innerHTML != '��� ����') cnt++;
			if (cnt == 7) <% // TODO ��ư ��ü %>
		}
	</script>
</body>
</html>
