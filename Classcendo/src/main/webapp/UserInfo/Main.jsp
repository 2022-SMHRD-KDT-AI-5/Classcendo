<%@page import="java.util.*"%>
<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="main.css">
<title>Main</title>
<script src="student.js" defer></script>
</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	%>
	<header class="navbar">
		<div class="navbar__logo">
			<a href="student_record.html">
				<img src="../Image/logo_white.png" width="160" height="24">
			</a>
		</div>
		<div class="navbar_center">
			�ȳ��ϼ��� <%=info.getUserName()%>������ :)
		</div>
		<ul class="navbar__menu">
			<li><a href="">����������</a></li>
			<li><a href="">�α׾ƿ�</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>
	<table class="innerbox">
 		<tr>
 			<%if(srlList == null){ %>
				�б��� �������ּ���
				<button type="button" onclick="location.href='SignUp.jsp'">�б� ����</button>
			<%} else{%>
			<td class="innernav">
				<table>
					<tr class="inner_name">
						�� ����<br>
					</tr>
					<select id="srlNum" onchange="selectSrlSeq()">
						<option value="">�б޼���</option>
						<%for(StudentRecordListDTO srl : srlList){ %>
							<option value=<%=srl.getSrlSeq() %>><%=srl.getSrlName() %></option>
						<%} %>
					</select>
					<div id="studentList">
					</div>
				</table>
			</td>
			<td class="innersection">
				<table>
					<div class="inner_title">�л���Ϻ�</div>
					<div class="inner_name" id="stdName"></div>
					<div class="inner_text">�л� �ൿƯ�� �� �����ǰ�</div>
					<div class="inner_textbox">
						<center>
							<textarea placeholder="���� �Է�" class="textarea" id="stdContent"></textarea>
						</center>
					</div>
					<div id="stdAnalysisBtn">
					</div>
				</table>
			</td>
		</tr>
		<%}%>
	</table>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		// �л��� ����
		function selectSrlSeq(){
			var srlNum = $('#srlNum');
			if(srlNum.val() != "") getSrList(srlNum);
		}
	
		// �л���� �ҷ�����
		function getSrList(srlNum){
			$.ajax({
				type : "post",
				url : "../GetStudentList",
				data : {
					'srlSeq' : srlNum.val()
				},
				dataType : "json",
				success : function(data) {
					var result = null;
					$.each(data, function(i) {
						<% // TODO html %>
						result += "<tr>"
								+ "<td onclick='getStudentRecord(" + data[i].srSeq + ")'>" + data[i].stdNum + "��</td>"
								+ "<td onclick='getStudentRecord(" + data[i].srSeq + ")'>" + data[i].stdName + "</td>"
								+ "<td>" + data[i].srDate.substring(0, 10) + "</td>"
								+ "<td><button class='inner_btn1' onclick='getAnalysisResult(" + data[i].srSeq + ")'>�м����</button></td>"
								+ "</tr>";
					});
					var text = $('#studentList');
					text.html("");
					if(result != null){
						text.html(result);
					}
				},
				error : function(e) {
					alert("��û����");
				}
			});
		}
		
		// �л���� �ҷ�����
		function getStudentRecord(srSeq){
			$.ajax({
				type : "post",
				url : "../GetStudentRecord",
				data : {
					'srSeq' : srSeq
				},
				dataType : "json",
				success : function(data) {
					<% // TODO html ���� %>
					$('#stdName').html(data.stdNum + "��" + data.stdName)
					$('#stdContent').html(data.srContent)
					$('#stdAnalysisBtn').html("<button type='button' class='inner_btn'>�м�</button>")
				},
				error : function(e) {
					alert("��û����");
				}
			});
		}
		
		// �м� ��� �ҷ�����
		function getAnalysisResult(){
			$.ajax({
				type : "post",
				url : "../GetAnalysisResult",
				data : {
					'srSeq' : $("#srSeq").val()
				},
				dataType : "json",
				success : function(data) {
					var result = [ data.arlSeq, data.srSeq,
						+ data.tendency1Rate, data.tendency2Rate, data.tendency3Rate, data.tendency4Rate,
						+ data.arlGraphPath, data.jobsSeq ];
					list.push(result);
					<% // TODO html, id���� %>
					var text = $('#test');
					text.html("");
					if (result != null) {
						text.html(result);
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