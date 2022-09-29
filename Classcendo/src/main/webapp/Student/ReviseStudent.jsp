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
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumABbaEuiYeonAePyeonJi.css" rel="stylesheet">
<style>
	body {
	    background-color: #133f12;
	    background-size: cover;
	    min-height: 100vh;
	}
</style>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO)session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>) session.getAttribute("srlList");
	%>
	<header class="navbar">
		<div class="navbar__logo">
			<a href="../Student/ReviseStudentRecord.jsp">
				<image src="../Image/logo_white.png" width="160" height="24">
			</a>
		</div>
		<div class="navbar_center">
			안녕하세요 <%=info.getUserName() %>선생님 :)
		</div>
		<ul class="navbar__menu">
			<li><a href="../UserInfo/MyPage.jsp">마이페이지</a></li>
			<li><a href="#popSignOut" class="btn_open">로그아웃</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>

	<div class="innerbox">
		<table>
			<th colspan=4>
				<select class="select_class" id="srlNum" onchange="selectSrlSeq()">
					<option value="">학급선택</option>
					<%for(StudentRecordListDTO srl : srlList){ %>
						<option value=<%=srl.getSrlSeq() %>><%=srl.getSrlName() %></option>
					<%} %>
				</select>
			</th>
		</table>
		<table>
			<tr name="trStaff" class="class_title">
				<td class="firstline">번호</td>
				<td class="firstline">이름</td>
				<td class="secondline"><button name="Add_stu" class="Add_stu">추가</button></td>
				<td class="secondline"><button name="save_stu" class="Add_stu" onclick="getStudentInfo()">저장</button></td>
			</tr>
		</table>
		<div id="studentList">
<!-- 			<table>
				<tr style="display:none;">
					<td><input type="text" class="textbox" placeholder="번호" name='stdNum'></td>
					<td><input type="text" class="textbox" placeholder="이름" name='stdName'></td>
					<td><button class="btn_del" name="delStaff" onclick="#popDelete">삭제</button></td>
					<td></td>
				</tr>
			</table> -->
		</div>
		<table>
			<th colspan="4"><img src="../Image/cha.png" width="600px" height="100px"></th>
		</table>
	</div>
    <div id="popSignOut" class="pop_wrap" style="display:none;">
		<div class="pop_inner">
  			<p class="dsc">로그아웃 하시겠습니까?</p>
  			<button type="button" class="btn_yes" onclick="location.href='../SignOutService'">예</button>
  			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
  		</div>
	</div>
	<div id="popDelete" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">삭제 하시겠습니까?</p>
			<button type="button" class="btn_yes" onclick="closePop()">예</button>
			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
		</div>
	</div>
	<script src="pop.js"></script>
	<script>
		// pop 닫기
		function closePop(){
			$('#popSignOut').css("display", "none");
		}
		
		//추가 버튼
		$(document).on(
			"click",
			"button[name=Add_stu]",
			function() {
				var addStaffText = "<tr>"
								+ "<td><input type='text' class='textbox' placeholder='번호' name='stdNum'></td>"
								+ "<td><input type='text' class='textbox' placeholder='이름' name='stdName'></td>"
								+ "<td><button class='btn_del' name='delStaff'>삭제</button></td>"
								+ "<td></td>"
								+ "</tr>"
				var trHtml = $("tr[name=trStaff]:last"); // last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
				trHtml.after(addStaffText); // 마지막 trStaff명 뒤에 붙인다.
			});

		//삭제 버튼
		$(document).on(
			"click",
			"button[name=delStaff]",
			function() {
				var trHtml = $(this).parent().parent();
				trHtml.remove(); //tr 태그 삭제
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
							+ "<td><input type='text' class='textbox' placeholder='번호' id='stdNum" + num + "' value='" + data[i].stdNum + "'></td>"
							+ "<td><input type='text' class='textbox' placeholder='이름' id='stdName" + num + "' value='" + data[i].stdName + "'></td>"
							+ "<td><button class='btn_del' name='delStaff' id='stdDelete" + num++ + "' onclick='#popDelete'>삭제</button></td>"
							+ "<td></td>"
							+ "</tr>"
				});
				var text = $('#studentList');
				text.html("");
				if(result != null){
					text.html("<table>" + result + "</table>");
				}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
 	
 	// 학생 정보 담을 리스트 생성
 	function getStudentInfo(){
 		var nums = "";
 		var names = "";
 		$('input[name=stdNum]').each(function(index, item){
 			nums += $(item).val() + ",";
 		})
 		$('input[name=stdName]').each(function(index, item){
 			names += $(item).val() + ",";
 		})
 		reviseStudent(nums, names);
 	}
 	
	// 학생 정보 저장하기
	function reviseStudent(nums, names){
		alert(names);
		$.ajax({
			type : "post",
			url : "../ReviseStudentService",
			data : {
				'srlSeq' : $('#srlNum').val(),
				'stdNums' : nums,
				'stdNames' : names
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