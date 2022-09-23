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

	<%
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>) session.getAttribute("srlList");
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	%>

	<%if (srlList == null) {%>
		<p>학급 생성해라~~~</p>
	<%} else { %>
		<select id="srlSeq">
		<%for (StudentRecordListDTO srlDTO : srlList) { %>
			<option value=<%=srlDTO.getSrlSeq()%>><%=srlDTO.getSrlName()%></option>
		<%}	%>
		</select>
	<%}	%>
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		// 학생목록 불러오기
		function getSrList(){
			$.ajax({
				type : "post",
				url : "../GetStudentList",
				data : {
					'srlSeq' : $("#srlSeq").val()
				},
				success : function(result) {
					<% // TODO html, id변경 %>
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
		
		// 학생기록 불러오기
		function getStudentRecord(){
			$.ajax({
				type : "post",
				url : "../GetStudentRecord",
				data : {
					'srSeq' : $("#srSeq").val()
				},
				dataType : "json",
				success : function(data) {
					var list = [];
					$.each(data, function(i) {
						var result = [ data[i].srSeq, data[i].stdNum, data[i].stdName, data[i].srContent, data[i].srDate ];
						list.push(result);
					});
					<% // TODO html, id변경 %>
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
		
		// 분석 결과 불러오기
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
					<% // TODO html, id변경 %>
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