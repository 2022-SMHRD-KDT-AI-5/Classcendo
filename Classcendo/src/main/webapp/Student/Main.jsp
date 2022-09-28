<%@page import="java.util.*"%>
<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Main.css">
<title>Classcendo</title>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	%>
	<header class="navbar">
		<div class="navbar__logo">
			<a href="../Student/Main.jsp">
				<img src="../Image/logo_white.png" width="160" height="24">
			</a>
		</div>
		<div class="navbar_center">
			안녕하세요 <%=info.getUserName()%>선생님 :)
		</div>
		<ul class="navbar__menu">
			<li><a href="../Student/ReviseStudent.jsp">마이페이지</a></li>
			<li><a href="../SignOutService">로그아웃</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>
	<table class="innerbox">
 		<tr>
			<td class="innernav">
				<table>
					<tr class="inner_name">
						반 선택<br>
					</tr>
					<select id="srlNum" onchange="selectSrlSeq()">
						<option value="">학급선택</option>
						<%for(StudentRecordListDTO srl : srlList){ %>
							<option value=<%=srl.getSrlSeq() %>><%=srl.getSrlName() %></option>
						<%} %>
					</select>
					<div class="scro" id="studentList">
					</div>
				</table>
			</td>
			<td class="innersection" id="innersection">
				<table>
					<div class="inner_title">학생기록부</div>
					<div class="inner_name" id="stdName"></div>
					<div class="inner_text">학생 행동특성 및 종합의견</div>
					<div class="inner_textbox" id="srTextarea"></div>
					<div id="stdSaveBtn"></div>
				</table>
			</td>
		</tr>
	</table>
	
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
					$.each(data, function(i) {
						result += "<div class='in'>"
								+ "<div class='name' onclick='getStudentRecord(" + data[i].srSeq + ")'>"
								+ data[i].stdNum + "번 " + data[i].stdName + " " + data[i].srDate.substring(0, 10)
								+ "</div>"
								+ "<div class='namebtn'>"
								+ "<button class='inner_btn1' onclick='getAnalysisResult(" + data[i].srSeq + ")'>분석결과</button>"
								+ "</div>"
								+ "</div>"
					});
					var text = $('#studentList');
					text.html("");
					if(result != null){
						text.html(result);
						$('#innersection').html("<table>"
												+ "<div class='inner_title'>학생기록부</div>"
												+ "<div class='inner_name' id='stdName'></div>"
												+ "<div class='inner_text'>학생 행동특성 및 종합의견</div>"
												+ "<div class='inner_textbox' id='srTextarea'>"
												+ "</div>"
												+ "<div id='stdSaveBtn'>"
												+ "</div>"
												+ "</table>");
					}
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}
		
		// 학생기록 불러오기
		function getStudentRecord(srSeq){
			$.ajax({
				type : "post",
				url : "../GetStudentRecordService",
				data : {
					'srSeq' : srSeq
				},
				dataType : "json",
				success : function(data) {
					$('#stdName').html(data.stdNum + "번 " + data.stdName)
					if(data.srContent == null) {
						$('#srTextarea').html("<center>"
											+ "<textarea placeholder='내용 입력' class='textarea' id='srContent'></textarea>"
											+ "</center>"
											);
					}
					else $('#srTextarea').html("<center>"
										+ "<textarea placeholder='내용 입력' class='textarea' id='srContent'>"
										+ data.srContent
										+ "</textarea>"
										+ "</center>"
										);
					$('#stdSaveBtn').html("<button type='button' class='inner_btn' onclick='updateStudentRecord(" + data.srSeq + ")'>저장</button>");
				},
				error : function(e) {
					alert("요청실패");
				}
			});
		}
		
		// 학생기록 저장하기
		function updateStudentRecord(srSeq){
			$.ajax({
				type : "post",
				url : "../UpdateStudentRecordService",
				data : {
					'srSeq' : srSeq,
					'srContent' : $('#srContent').val()
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
		
		// 분석 결과 불러오기
		function getAnalysisResult(srSeq){
			$.ajax({
				type : "post",
				url : "../GetAnalysisResultService",
				data : {
					'srSeq' : $("#srSeq").val()
				},
				dataType : "json",
				success : function(data) {
					var result = [ data.arlSeq, data.srSeq,
						+ data.tendency1Rate, data.tendency2Rate, data.tendency3Rate, data.tendency4Rate,
						+ data.arlGraphPath, data.jobsSeq ];
					list.push(result);
					var text = $('#test');
					text.html("");
					if (result != null) {
						text.html(result);
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