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
			안녕하세요 <%=info.getUserName()%>선생님 :)
		</div>
		<ul class="navbar__menu">
			<li><a href="">마이페이지</a></li>
			<li><a href="">로그아웃</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>
	<table class="innerbox">
		<tr>
			<td class="innernav">
				<table>
					<tr class="inner_name">
						반 선택
						<br>
					</tr>
					<select>
						<option value="">--Please choose an option--</option>
						<option value="1반">1반</option>
						<option value="2반">2반</option>
						<option value="3반">3반</option>
						<option value="4반">4반</option>
						<option value="5반">5반</option>
					</select>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
					<tr>
						<td>1번</td>
						<td>강*린</td>
						<td>22.09.23</td>
						<td><button class="inner_btn1">분석결과</button></td>
					</tr>
				</table>
			</td>
			<td class="innersection">
				<table>
					<div class="inner_title">학생기록부</div>
					<div class="inner_name">01번 강 * 린</div>
					<div class="inner_text">학생 행동특성 및 종합의견</div>
					<div class="inner_textbox">
						<center>
							<textarea placeholder="내용 입력" class="textarea"></textarea>
						</center>
					</div>
					<div>
						<button type="button" onclick="location.href='view.html'"
							class="inner_btn">분석</button>
					</div>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>