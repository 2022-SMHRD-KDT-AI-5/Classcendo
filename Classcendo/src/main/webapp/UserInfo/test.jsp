<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="#" class="login-form" id="checkPwForm">
		<img src='../Image/logo_white.png' alt='' width='500' height='65'><br><br>
		<div class='textb'>
			<input type='text' class='form-control' id='pw' placeholder='pw'>
		</div>
		<div class='Passwordbtn'>
			<button type='button' class='btnfind' id='btnCheckBtn' onclick='pwCheck()'>Ȯ��</button>
		</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	// �л� ����
	function deleteStudent(){
		$.ajax({
			type : "post",
			url : "../DeleteStudentRecordService",
			data : {
				'srSeq' : $("#srSeq").val()
			},
			dataType : "text",
			success : function(result) {
				<% // TODO html, id���� %>
				var text = $('#test');
				text.html("");
				if (result) {
					// ��������
					text.html(result);
				}
			},
			error : function(e) {
				alert("��û����");
			}
		});
	}
	
	
		// ȸ������ ���� �� ���� Ȯ��
		function pwCheck() {
			if ($("#pw").val() == '') {
				alert("Password �Է� �ʿ�");
				return;
			} else {
				pwCheckResult()
				return;
			}
		}

		// ��й�ȣ Ȯ�� ���
		function pwCheckResult() {
			$.ajax({
					type : "post",
					url : "../CheckPwToMyPageService",
					data : {
						'pw' : $("#pw").val()
					},
					dataType : "text",
					success : function(idCheck) {
						var text = $('#checkPwForm');
						text.html("");
				<% // TODO HTML ���� �ʿ� ȸ������ ���� �������� ����%>
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
									+ "<div class='textb'>"
									+ "<input type='text' class='form-control' id='name' placeholder='Name'>"
									+ "</div>"
									+ "<div class='textb'>"
									+ "<input type='email' class='form-control' id='email' placeholder='Email' onkeyup='emailDuplicateCheck()'>"
									+ "</div>"
									+ "<img src='../Image/check1.png' class='img_check1' id='emailCheckIcon'>"
									+ "<div class='Passwordbtn'>"
									+ "<button type='button' class='btnfind'id='reviseInfoBtn' onclick='reviseInfo()'>Revise</button>"
									+ "</div>");
				} else {
					text.html("<img src='../Image/logo_white.png' alt='' width='500' height='65'><br>"
							+ "<br>"
							+ "<div class='textb'>"
							+ "<input type='text' class='form-control' id='pw' placeholder='pw'>"
							+ "</div>"
							+ "<div class='Passwordbtn'>"
							+ "<button type='button' class='btnfind' id='btnCheckBtn' onclick='pwCheck()'>Ȯ��</button>"
							+ "</div>");
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.")
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
		
		// �̸��� �ߺ� Ȯ��
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
					alert("��û����");
				}
			});
		}
		
		// �̸��� �ߺ� Ȯ�� ���
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

		// ��й�ȣ Ȯ�� �� ȸ������ ���� �� ��й�ȣ Ȯ��
		function reviseInfo() {
 			if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Password Ȯ�� �ʿ�");
				return;
			} else{
				reviseInfoResult()
				return;
			}
		}

		// ȸ������ ���� ��ư
		function reviseInfoResult() {
			$.ajax({
				type : "post",
				url : "../ReviseInfoService",
				data : {
					'pw' : $("#pw").val(),
					'name' : $("#name").val(),
					'email' : $("#email").val()
				},
				success : function(result) {
					var text = $('#checkPwForm');
					text.html("");
					<% // TODO HTML ���� �ʿ� ��й�ȣ ���� ���� text�� �α��� â���� �̵��ϴ� ��ư%>
					if (result == 'true') {
						text.html("<h5 class='input'>Revise Info Success</h5>"
										+ "<a href='mypage.jsp' class='link'>Sign in/Sign up</a>");
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