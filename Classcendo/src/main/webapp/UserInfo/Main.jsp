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
<title>Nav bar</title>
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
			<td class="innernav">
				<table>
					<tr class="inner_name">
						�� ����
						<br>
					</tr>
					<select>
						<option value="">--Please choose an option--</option>
						<option value="1��">1��</option>
						<option value="2��">2��</option>
						<option value="3��">3��</option>
						<option value="4��">4��</option>
						<option value="5��">5��</option>
					</select>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
					<tr>
						<td>1��</td>
						<td>��*��</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">�м����</button></td>
					</tr>
				</table>
			</td>
			<td class="innersection">
				<table>
					<div class="inner_title">�л���Ϻ�</div>
					<div class="inner_name">01�� �� * ��</div>
					<div class="inner_text">�л� �ൿƯ�� �� �����ǰ�</div>
					<div class="inner_textbox">
						<center>
							<textarea placeholder="���� �Է�" class="textarea"></textarea>
						</center>
					</div>
					<div>
						<button type="button" onclick="location.href='view.html'"
							class="inner_btn">�м�</button>
					</div>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>