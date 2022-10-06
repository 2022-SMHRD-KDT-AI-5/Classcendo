<%@page import="Analysis.Model.AnalysisResultListDTO"%>
<%@page import="Student.Model.StudentRecordListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserInfo.Model.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="Analysis.css">
<link rel="stylesheet" href="../UserInfo/MyPage.css">
<script src="ana.js" defer></script>
<!-- CSS only -->
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/xbootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 그래프 -->
<script src="https://code.highcharts.com/highcharts.js"></script>

</head>
<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<AnalysisResultListDTO> arlList = (ArrayList<AnalysisResultListDTO>)session.getAttribute("arlList");
	String srSeq = request.getParameter("srSeq");
	%>
	<header class="navbar">
		<div class="navbar__logo">
			<a href="../Student/ReviseStudentRecord.jsp">
				<image src="../Image/logo_white.png" width="160" height="24">
			</a>
		</div>
		<div class="navbar_center">
			안녕하세요
			<%=info.getUserName()%>선생님 :)
		</div>
		<ul class="navbar__menu">
			<li><a href="../UserInfo/MyPage.jsp">마이페이지</a></li>
			<li><a href="#popSignOut" class="btn_open">로그아웃</a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
	</header>
	<div>
		<div class="innertitle">
			<div class="inner_left">
			 <!-- 이름 sel 날짜 -->
                <div class="first">
                    <div class="first_name" id="stdInfo">
                    </div>
                    <select class="first_sel" id="arlSeq" onchange="selectArlSeq()">
                    	<% if(arlList != null){ %>
						<option value="<%=arlList.get(0).getArlSeq() %>" selected disabled hidden><%=arlList.get(0).getArlDate().substring(0, 10) %></option>
						<%for(AnalysisResultListDTO arl : arlList){ %>
							<option value=<%=arl.getArlSeq() %>><%=arl.getArlDate() %></option>
						<%}}else{ %>
						<option selected disabled hidden>분석 결과 없음</option>
						<%} %>
                    </select>
                    <div class="first_date">2022년 10월 05일</div>
                </div>
				<div class="ana">
					<div class="anatext">성향 분석 결과</div>
				</div>
				<!-- 그래프 -->
				<div>
					<figure class="highcharts-figure">
						<div id="container"></div>
					</figure>
				</div>
			</div>

			<!-- 추천, 상담기록 -->
			<div class="inner_right">
				<div class="accordion horizontal">
					<ul>
						<li><input type="radio" id="vert-1" name="vert-accordion"
							checked="checked" /> <label for="vert-1">직업&nbsp;추천</label>
							<div class="content">
								<h3 id="jobsList">직업 추천</h3>
								<p></p>
							</div></li>
						<div id="aboutJob">
						<li><input type="radio" id="vert-2" name="vert-accordion" />
							<label for="vert-2" id="job">&nbsp;</label>
							<div class="content">
								<h3 id="jobInfo"></h3>
							</div>
						</li>
						</div>
					</ul>
				</div>
				<div class="comm">
					<div class="text">상담기록</div>
					<div class="form-floating">
						<div id="consultText">
						<textarea class="form-control" placeholder="Leave a comment here"
							style="height: 100px" id="consultRecord"></textarea>
						</div>
						<!-- <label for="floatingTextarea2">Comments</label> -->
						<div class="d-grid gap-2 d-md-flex justify-content-md-end" id="saveBtn">
							<button class="btn btn-primary" type="button" onclick="saveCS(<%=srSeq%>)">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="popSignOut" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">로그아웃 하시겠습니까?</p>
			<button type="button" class="btn_yes"
				onclick="location.href='../SignOutService'">예</button>
			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		// 화면 로딩 시 실행
		window.onload = function() {
			getStudentInfo();
			getArlRate(<%=arlList.get(0).getArlSeq() %>);
		}
	
		// pop 닫기
		function closePop() {
			$('#popSignOut').css("display", "none");
		}
		
		var pieColors = (function() {
			var colors = [], base = Highcharts.getOptions().colors[0], i;

			for (i = 0; i < 10; i += 1) {
				// Start out with a darkened base color (negative brighten), and end
				// up with a much brighter color
				colors.push(Highcharts.color(base).brighten((i - 3) / 7).get());
			}
			return colors;
		}());

		// Build the chart
		function makeHighcharts(r1, r2, r3, r4, arlSeq){
			Highcharts.chart('container', {
			    chart: {
			        plotBackgroundColor: null,
			        plotBorderWidth: null,
			        plotShadow: false,
			        type: 'pie'
			    },
			    title: {
			        text: '역량 분석 그래프'
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			    },
			    accessibility: {
			        point: {
			            valueSuffix: '%'
			        }
			    },
			    plotOptions: {
			        pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            colors: pieColors,
			            dataLabels: {
			                enabled: true,
			                format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
			                distance: -50,
			                filter: {
			                    property: 'percentage',
			                    operator: '>',
			                    value: 4
			                }
			            }
			        }
			    },
			    series: [{
			        name: 'Share',
			        data: [
			            { name: '자기관리역량', y: r1 },
			            { name: '대인관계역량', y: r2 },
			            { name: '시민역량', y: r3 },
			            { name: '문제해결역량', y: r4 },
			        ]
			    }]
			});
			getConsultingRecord(arlSeq);
		}
		
		// 학생 정보 받아오기
		function getStudentInfo(){
			$.ajax({
				type : "post",
				url : "../GetStudentInfoService",
				data : {
					'srSeq' : <%=srSeq %>
				},
				dataType : "json",
				success : function(data){
					var text = $('#stdInfo');
					text.html("");
					text.html(data.stdNum + "번   " + data.stdName);
				},
				error : function(e) {
					alert("학생 정보 요청실패");
				}
			});
		}
		
		// option 선택 시 변경사항
		function selectArlSeq(){
			var arlSeq = $('#arlSeq').val();
			getArlRate(arlSeq);
		}
		
		// 그래프 비율 설정 및 직업 추천
 		function getArlRate(arlSeq){
			$.ajax({
				type : "post",
				url : "../GetAnalysisResultService",
				data : {
					'arlSeq' : arlSeq
				},
				dataType : "json",
				success : function(data){
					$('#aboutJob').html("<li><input type='radio' id='vert-2' name='vert-accordion' />"
							+ "<label for='vert-2' id='job'>&nbsp;</label>"
							+ "<div class='content'>"
							+ "<h3 id='jobInfo'></h3>"
							+ "</div></li>");
					var text = "";
					var jobs = data.jobsName.split(',');
 					$.each(jobs, function(i) {
						text += "<p onclick='getJobInfo(" + jobs[i] + ")'>" + jobs[i] + "</p>";
					});
					var jobsList = $('#jobsList');
					jobsList.html("");
					jobsList.html(text);
					makeHighcharts(data.tendency1Rate, data.tendency2Rate, data.tendency3Rate, data.tendency4Rate, arlSeq);
				},
				error : function(e) {
					alert("그래프 결과 요청실패");
				}
			});
		}
		
		// 직업 정보 받아오기
 		function getJobInfo(jobName){
			$.ajax({
				type : "post",
				url : "../GetJobInfoService",
				data : {
					'jobName' : jobName
				},
				dataType : "json",
				success : function(data){
					var text = "";
/* 					text += "<b><u>관련 학과</u></b><br>"
						+ "<div>" + data.relationDept + "</div><br><br>"
						+ "<b><u>관련 자격증</u></b><br>"
						+ "<div>" + data.relationCert + "</div><br><br>"; */
					text += "<b><u>관련 학과</u></b><br>"
						+ "<div>ㅎㅎㅎ</div><br><br>"
						+ "<b><u>관련 자격증</u></b><br>"
						+ "<div>ㅗㅗㅗ</div><br><br>";
					$('#job').html("");
					$('#job').html(jobName);
					$('#jobInfo').html("");
					$('#jobInfo').html(text);
				},
				error : function(e) {
					alert("직업 정보 요청실패");
				}
			});
 		}
		
		// 상담 기록 불러오기
		function getConsultingRecord(arlSeq){
			$.ajax({
				type : "post",
				url : "../GetConsultingRecord",
				data : {
					'arlSeq' : arlSeq
				},
				dataType : "json",
				success : function(data){
					$('#consultText').html("<textarea class='form-control' placeholder='Leave a comment here'"
										+ "style='height: 100px' id='consultRecord'></textarea>");
					var consultRecord = $('#consultRecord');
					var saveBtn = $('#saveBtn');
					if(data != null){
						consultRecord.html(data.scContent);
						saveBtn.html("<button class='btn btn-primary' type='button' onclick='updateCS(" + arlSeq + ")'>저장</button>");
					}else if (data == null){
						consultRecord.html("");
						saveBtn.html("<button class='btn btn-primary' type='button' onclick='addCS(" + arlSeq + ")'>저장</button>");
					}
				},
				error : function(e) {
					alert("상담 기록 요청실패");
				}
			});
		}
		
		// 상담 기록 저장하기
 		function addCS(arlSeq){
			$.ajax({
				type : "post",
				url : "../AddConsultingRecord",
				data : {
					'srSeq' : <%=srSeq %>,
					'arlSeq' : arlSeq,
					'consultRecord' : $('#consultRecord').val()
				},
				success : function(result){
					if(result == 'true') alert("저장 성공");
					else alert("저장 실패");
				},
				error : function(e) {
					alert("상담 기록 저장 요청실패");
				}
			});
 		}
 		
 	// 상담 기록 수정하기
 		function updateCS(arlSeq){
 			alert(arlSeq)
			$.ajax({
				type : "post",
				url : "../UpdateConsultingRecord",
				data : {
					'arlSeq' : arlSeq,
					'consultRecord' : $('#consultRecord').val()
				},
				success : function(result){
					if(result == 'true') alert("저장 성공");
					else alert("저장 실패");
				},
				error : function(e) {
					alert("상담 기록 업데이트 요청실패");
				}
			});
 		}
	</script>
</body>
</html>