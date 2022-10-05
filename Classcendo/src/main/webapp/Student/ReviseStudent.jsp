<%@page import="Student.Model.StudentRecordDTO"%>
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
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	ArrayList<StudentRecordDTO> stdList = (ArrayList<StudentRecordDTO>)session.getAttribute("stdList");
	int srlSeq = Integer.parseInt(request.getParameter("srlSeq"));
	String srlName = "학급 선택";
	for(StudentRecordListDTO srl : srlList){
		if(srl.getSrlSeq() == srlSeq) srlName = srl.getSrlName();
	}
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
		<div class="innersection">
			<div class="headt">
				<select class="select_class" id="srlNum" onchange="selectSrlSeq()">
					<option value="<%=srlSeq %>" selected disabled hidden><%=srlName %></option>
					<%for(StudentRecordListDTO srl : srlList){ %>
						<option value=<%=srl.getSrlSeq() %>><%=srl.getSrlName() %></option>
					<%} %>
				</select>
			</div>
			<div name="trStaff" class="class_title">
				<div class="firstline">번호</div>
				<div class="firstline">이름</div>
				<div class="secondline"><button name="Add_stu" class="Add_stu">추가</button></div>
				<div class="secondline"><button name="save_stu" class="Add_stu" onclick="getStudentInfo(<%=srlSeq %>)">저장</button></div>
			</div>
			<div class="ti" id="studentList">
			<%if(stdList != null){
	 			for(StudentRecordDTO std : stdList){ %>
				<div class="tit">
					<div class="titl"><input type="text" class="textbox" placeholder="번호" id="stdNum<%=std.getSrSeq() %>" value='<%=std.getStdNum() %>'></div>
					<div class="titl"><input type="text" class="textbox" placeholder="이름" id="stdName<%=std.getSrSeq() %>" value='<%=std.getStdName() %>'></div>
					<div class="titl">
						<button class="btn_del" name="<%=std.getSrSeq() %>" onclick='deletePop(<%=std.getSrSeq() %>, <%=srlSeq %>)'>삭제</button>
						<button class="btn_del" onclick='reviseStudent(<%=std.getSrSeq() %>)'>수정</button>
					</div>
				</div>
			<%}} %>
			</div>
			<div class="imgg">
				<img src="../Image/cha.png" width="600px" height="100px">
			</div>
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
				var addStaffText = "<div class='tit'>"
								+ "<div><input type='text' class='textbox' placeholder='번호' name='stdNum'></div>"
								+ "<div><input type='text' class='textbox' placeholder='이름' name='stdName'></div>"
								+ "<div>"
								+ "<button class='btn_del' name='delStaff'>삭제</button>"
								+ "<button class='btn_dell'></button>"
								+ "</div>"						
								+ "</div>"
				var trHtml = $("#studentList");
				trHtml.append(addStaffText);
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
	
	function deletePop(srSeq, srlSeq){
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			deleteStudent(srSeq, srlSeq);
		}
	}
	
	function deleteStudent(srSeq, srlSeq){
		$.ajax({
			type : "post",
			url : "../DeleteStudentService",
			data : {
				'srSeq' : srSeq,
				'srlSeq' : srlSeq
			},
			success : function(result) {
				if(result == 'true') {
					var trHtml = $('button[name=' + srSeq + ']').parent().parent();
					trHtml.remove(); //tr 태그 삭제
				}else{
					alert("삭제 실패");	
				}
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	
	// 학생 정보 변경
	function reviseStudent(srSeq, stdNum, stdName){
		$.ajax({
			type : "post",
			url : "../RevisePersonalStudentService",
			data : {
				'srSeq' : srSeq,
				'stdNum' : $('#stdNum' + srSeq).val(),
				'stdName' : $('#stdName' + srSeq).val()
			},
			success : function(result) {
				if(result == 'true') alert("수정 성공")
				else alert("수정 실패");
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	
	// 학생부 변경
	function selectSrlSeq(){
		var srlNum = $('#srlNum');
		if(srlNum.val() != "") getStdList(srlNum);
	}
	
	function getStdList(srlNum){
		window.location.href = "../GetStudentListToReviseService?srlSeq=" + srlNum.val();
	}
 	
 	// 학생 정보 담을 리스트 생성
 	function getStudentInfo(srlSeq){
 		var nums = "";
 		var names = "";
 		$('input[name=stdNum]').each(function(index, item){
 			nums += $(item).val() + ",";
 		})
 		$('input[name=stdName]').each(function(index, item){
 			names += $(item).val() + ",";
 		})
 		saveStudent(srlSeq, nums, names);
 	}
 	
	// 학생 정보 저장하기
	function saveStudent(srlSeq, nums, names){
		$.ajax({
			type : "post",
			url : "../ReviseStudentService",
			data : {
				'srlSeq' : srlSeq,
				'stdNums' : nums,
				'stdNames' : names
			},
			success : function(data) {
				if(data == 'true') alert("저장 성공");
				else alert("저장 실패");
				window.location.href = "../GetStudentListToReviseService?srlSeq=" + srlSeq;
			},
			error : function(e) {
				alert("요청실패");
			}
		});
	}
	</script>
</body>
</html>