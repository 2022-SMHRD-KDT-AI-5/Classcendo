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
                    <div class="first_name">
                        1번 강나린
                    </div>
                    <select class="first_sel">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                    <div class="first_date">2022년 10월 05일</div>
                </div>
				<div class="ana">
					<div class="anatext">성향분석</div>
					<div class="content">
						<p></p>
					</div>
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
								<h3>직업 추천</h3>
								<p></p>
							</div></li>
						<li><input type="radio" id="vert-2" name="vert-accordion" />
							<label for="vert-2">학과&nbsp;추천</label>
							<div class="content">
								<h3>학과 추천</h3>
								<p></p>
							</div></li>
					</ul>
				</div>

				<div class="comm">
					<div class="text">상담기록</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here"
							style="height: 100px"></textarea>
						<!-- <label for="floatingTextarea2">Comments</label> -->
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary" type="button">저장</button>
						</div>
					</div>
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
		            { name: '자기관리역량', y: 74.03 },
		            { name: '대인관계역량', y: 12.66 },
		            { name: '시민역량', y: 4.96 },
		            { name: '문제해결역량', y: 2.49 },
		        ]
		    }]
		});
	</script>
</body>
</html>