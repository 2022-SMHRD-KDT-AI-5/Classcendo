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
			<button type='button' class='btnfind' id='btnCheckBtn' onclick='pwCheck()'>확인</button>
		</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	// 학생 삭제
	function deleteStudent(){
		$.ajax({
			type : "post",
			url : "../DeleteStudentRecordService",
			data : {
				'srSeq' : $("#srSeq").val()
			},
			dataType : "text",
			success : function(result) {
				<% // TODO html, id변경 %>
				var text = $('#test');
				text.html("");
				if (result) {
					// 없어지게
					text.html(result);
				}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	
	
		// 회원정보 수정 시 정보 확인
		function pwCheck() {
			if ($("#pw").val() == '') {
				alert("Password 입력 필요");
				return;
			} else {
				pwCheckResult()
				return;
			}
		}

		// 비밀번호 확인 결과
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
				<% // TODO HTML 수정 필요 회원정보 수정 페이지로 수정%>
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
							+ "<button type='button' class='btnfind' id='btnCheckBtn' onclick='pwCheck()'>확인</button>"
							+ "</div>");
					alert("비밀번호가 틀렸습니다.")
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

		// 비밀번호 확인 후 회원정보 변경 시 비밀번호 확인
		function reviseInfo() {
 			if (document.getElementById("pwCheckIcon").src == 'http://localhost:8095/Classcendo/Image/check1.png') {
				alert("Password 확인 필요");
				return;
			} else{
				reviseInfoResult()
				return;
			}
		}

		// 회원정보 수정 버튼
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
					<% // TODO HTML 수정 필요 비밀번호 변경 성공 text와 로그인 창으로 이동하는 버튼%>
					if (result == 'true') {
						text.html("<h5 class='input'>Revise Info Success</h5>"
										+ "<a href='mypage.jsp' class='link'>Sign in/Sign up</a>");
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