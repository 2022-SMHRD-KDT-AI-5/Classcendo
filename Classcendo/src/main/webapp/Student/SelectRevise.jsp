<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../UserInfo/MyPage.css">
<script src="pop.js"></script>
<title>Classecndo</title>
</head>
<body>
    <nav class="navbar">
        <div class="navbar__logo">
            <a href="student_record.html">
                <image src="../Image/logo_white.png" width="160" height="24">
            </a>
        </div>

        <div class="navbar_center">
            안녕하세요 선생님 :)
        </div> 
        <ul class="navbar__menu">
            <li><a href="../UserInfo/MyPage.jsp">마이페이지</a></li>
            <li><a href="#popSignOut" class="btn_open">로그아웃</a></li>
        </ul>
    </nav>
        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>


        <div class="mypage_btn">
                <a href="../Student/ReviseClass.jsp" class="btn">학급정보 수정</a>
                <a href="../Student/ReviseStudent.jsp" class="btn">학생정보 수정</a>
        </div>
        
    <div id="popSignOut" class="pop_wrap" style="display:none;">
		<div class="pop_inner">
  			<p class="dsc">로그아웃 하시겠습니까?</p>
  			<button type="button" class="btn_yes" onclick="location.href='../SignOutService'">예</button>
  			<button type="button" class="btn_no" onclick="closePop()">아니오</button>
  		</div>
	</div>
	
	<script src="pop.js"></script>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		// pop 닫기
		function closePop(){
			$('#popSignOut').css("display", "none");
		}
	</script>
</body>
</html>