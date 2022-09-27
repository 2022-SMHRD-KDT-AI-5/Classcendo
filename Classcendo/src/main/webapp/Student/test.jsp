<%@page import="java.util.ArrayList"%>
<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	test
	<%
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>) session.getAttribute("srlList");
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	%>

	<%if (srlList == null) {%>
		<p>�б� �����ض�~~~</p>
	<%} else { %>
		<select id="srlSeq">
		<%for (StudentRecordListDTO srlDTO : srlList) { %>
			<option value=<%=srlDTO.getSrlSeq()%>><%=srlDTO.getSrlName()%></option>
		<%}	%>
		</select>
	<%}	%>
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		// �л���� �ҷ�����
		function getSrList(){
			$.ajax({
				type : "post",
				url : "../GetStudentList",
				data : {
					'srlSeq' : $("#srlSeq").val()
				},
				dataType : "json",
				success : function(data) {
					var list = [];
					$.each(data, function(i) {
						var result = [ data[i].srSeq, data[i].stdNum, data[i].stdName, data[i].srDate ];
						list.push(result);
					});
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
		
		// �л���� �ҷ�����
		function getStudentRecord(){
			$.ajax({
				type : "post",
				url : "../GetStudentRecord",
				data : {
					'srSeq' : $("#srSeq").val()
				},
				dataType : "json",
				success : function(data) {
					var data = [ data[i].srSeq, data[i].stdNum, data[i].stdName, data[i].srContent, data[i].srDate ];
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
		
		// �л� ��� ����
		function updateStudent(){
			$.ajax({
				type : "post",
				url : "../UpdateStudentRecordService",
				data : {
					'srSeq' : $("#srSeq").val(),
					'srContent' : $("#srContent").val()
				},
				success : function(result) {
					<% // TODO HTML ���� �ʿ� ȸ������ ���� �޽��� �� �α��� â���� �̵��ϴ� ��ư %>
					if (result) {
						alert("�����Ϸ�");
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