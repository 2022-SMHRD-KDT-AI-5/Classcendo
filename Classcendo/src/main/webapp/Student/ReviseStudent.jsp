<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Classcendo</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="ReviseStudent.css">
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>) session.getAttribute("srlList");
	%>
	<header class="navbar">
		<div class="navbar__logo">
			<a href="../Student/Main.jsp"> <image
					src="../Image/logo_white.png" width="160" height="24"></a>
		</div>
		<div class="navbar_center">안녕하세요 선생님 :)</div>
		<ul class="navbar__menu">
			<li><a href="">마이페이지</a></li>
			<li><a href="../SignOutService">로그아웃</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>

	<table class="innerbox">
		<td class="innersection">
			<table>
				<thead>
					<tr>
						<th>
							<select class="select_class" id="srlNum" onchange="selectSrlSeq()">
								<option value="">학급선택</option>
								<%for(StudentRecordListDTO srl : srlList){ %>
									<option value=<%=srl.getSrlSeq() %>><%=srl.getSrlName() %></option>
								<%} %>
							</select>
						</th>
					</tr>
				</thead>
			</table>
			<table>
				<thead>
					<tr name="trStaff">
						<th class="firstline">번호</th>
						<th class="firstline">이름</th>
						<th class="secondline"><button name="Add_stu" class="Add_stu">학생 추가</button></th>
						<th class="secondline"><button name="save_stu" class="Add_stu" onclick="getList()">저장</button></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="textbox" placeholder="번호"></td>
						<td><input type="text" class="textbox" placeholder="이름"></td>
						<td><button class="btn_del" name="delStaff">삭제</button></td>
					</tr>
				</tbody>
			</table>
			<div id="pop_info_1" class="pop_wrap" style="display: none;">
				<div class="pop_inner">
					<p class="dsc">정말 삭제 하시겠습니까?</p>
					<button type="button" class="btn_yes"
						onclick="location.href='login.html'">예</button>
					<button type="button" class="btn_no"
						onclick="location.href='mypage_1.html'">아니오</button>
				</div>
			</div>
	</table>

	<script>
		//추가 버튼
		$(document).on(
				"click",
				"button[name=Add_stu]",
				function() {
					var addStaffText = "<tr name='trStaff'>"
									+ "<td><input type='text' class='textbox' placeholder='번호' name='stdNum'></td>"
									+ "<td><input type=text' class='textbox' placeholder='이름' name='stdName'></td>"
									+ "<td><button class=btn_del name=delStaff'>삭제</button></td>"
									+ "</tr>";
					var trHtml = $("tr[name=trStaff]:last"); // last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
					trHtml.after(addStaffText); // 마지막 trStaff명 뒤에 붙인다.
				});

		//삭제 버튼
		$(document).on(
				"click",
				"button[name=delStaff]",
				function() {
				var trHtml = $(this).parent().parent();
				trHtml.remove(); //tr 테그 삭제
		});
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	 // 학생부 변경
	function selectSrlSeq(){
		var srlNum = $('#srlNum');
		if(srlNum.val() != "") getSrList(srlNum);
	}
    
 	// 학생목록 불러오기
	function getSrList(srlNum){
		$.ajax({
			type : "post",
			url : "../GetStudentListService",
			data : {
				'srlSeq' : srlNum.val()
			},
			dataType : "json",
			success : function(data) {
				var result = '';
				var num = 0;
				$.each(data, function(i) {
					result += "<tr>"
							+ "<td><input type='text' class='textbox' placeholder='번호' id='stdNum" + num + "'>"+data[i].stdNum+"</td>"
							+ "<td><input type='text' class='textbox' placeholder='이름' id='stdName" + num + "'>"+data[i].stdName+"</td>"
							+ "<td><button class='btn_del' name='delStaff' id='stdDelete" + num++ + "'>삭제</button></td>"
							+ "</tr>"
				});
				var text = $('#studentList');
				text.html("");
				if(result != null){
					text.html(result);
					alert(num);
				}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}	
	
/*   	// 학생 정보 리스트 생성
 	function getList(){
 		var stdNums = [];
 		var stdNames = [];
 		$('input[name=stdNum]').each(function(index, item){
 			stdNums.push($(item).val());
 		});
 		$('input[name=stdName]').each(function(index, item){
 			stdNames.push($(item).val());
 		});
 		reviseStudent(stdNums, stdNames)
 	} */
 	
	// 학생 정보 저장하기
	function reviseStudent(){
		$.ajax({
			type : "post",
			url : "../ReviseStudentService",
			data : {
				'srlSeq' : $('#srlNum').val(),
				'stdNums' : $('input[name=stdNum]').val(),
				'stdNames' : $('input[name=stdName]').val()
			},
			success : function(data) {
				if(data == 'true') alert("저장 성공");
				else alert("저장 실패");
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	</script>
</body>
</html>