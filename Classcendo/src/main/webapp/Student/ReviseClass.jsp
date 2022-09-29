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
    <link rel="stylesheet" href="stu_cont.css">
    <title>Nav bar</title>
    <script src="student.js" defer></script> 
    <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumABbaEuiYeonAePyeonJi.css" rel="stylesheet">
    <style>
        body {
            background: url('./image/bg.png') no-repeat center;
            background-size: cover;
            min-height: 100vh;
            /* display: flex;
            align-items: center;
            justify-content: center; */
        }
    </style>
</head>

<body>
	<%
	UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
	ArrayList<StudentRecordListDTO> srlList = (ArrayList<StudentRecordListDTO>)session.getAttribute("srlList");
	%>
    <header class="navbar">
        <div class="navbar__logo">
            <a href="../Student/Main.jsp">
                <image src="../image/logo_white.png" width="160" height="24">
            </a>
        </div>
        <div class="navbar_center">
            안녕하세요 <%=info.getUserName()%>선생님 :)
        </div>
        <ul class="navbar__menu">
            <li><a href="mypage_1.html">마이페이지</a></li>
            <li><a href="#popSignOut" class="btn_open">로그아웃</a></li>
        </ul>
    </header>
        <table class="innerbox">
            <tr>
                <td class="innernav">
                    
                    <div class="in">
                        <div class="in1">반 목록 </div>
                    </div>
                    <table>
                        <div class="scro">
                        <%for(StudentRecordListDTO srl : srlList){ %>
                            <div class="in">
                                <div class="name">
                                <%=srl.getSrlName() %>
                                </div>
                                <div clss="namebtn">
                                    <button class="inner_btn1">삭제</button>
                                </div>
                            </div>
						<%} %>
                            </div>
                              
                    </table>
                </td>
                <td class="innersection">
                    <div class="inner_title">
                        학급관리
                    </div>
                    <table>
                        <div class = "inner_textbox">
                            <div class="textb">
                                연도
                                <input type="text" class="form-control" placeholder="ex) 2022">
                            </div>
                            <div class="textb">
                                학년
                                <input type="text" class="form-control" placeholder="ex) 3">
                            </div>
                            <div class="textb">
                                반
                                <input type="text" class="form-control" placeholder="ex) 1">
                            </div>

                            <div class="JoinPassbtn">
                                <button type="button" class = "btn1" >Add</button>
                            </div>
                        </div>
                      
                     </table>
                </td>          
             </tr>
        </table>
        <div id="popSignOut" class="pop_wrap" style="display:none;">
    		<div class="pop_inner">
      			<p class="dsc">정말 로그아웃 하시겠습니까?</p>
      			<button type="button" class="btn_yes" onclick="../SignOutService'">예</button>
      			<button type="button" class="btn_no" onclick="">아니오</button>

    		</div>
		</div>
    
        <script src="pop.js"></script>
</body>
    
<script>

 // 학생부 변경
	function selectSrlSeq(){
		var srlNum = $('#srlNum');
		if(srlNum.val() != "") getSrList(srlNum);
	}
    
 // 학생목록 불러오기
	function getSrList(){
		$.ajax({
			type : "post",
			url : "../GetStudentListService",
			data : {
				'UserNum' : info.getUserNum()
			},
			dataType : "json",
			success : function(data) {
				var result = '';
				var num = 0;
				$.each(data, function(i) {
					result += "<tr>"
							+ "<td><input type='text' class='textbox' placeholder='번호' id='stdNum" + num + "'>"+data[i].stdNum+"</td>"
							+ "<td><input type='text' class='textbox' placeholder='이름' id='stdName" + num + "'>"+data[i].stdName+"</td>"
							+ "<td><button class='btn_del' name='delStaff' id='stdDelete" + num++ + "'>삭제</button></td>"
							+ "</tr>"
				});
				
				<
            
				var text = $('#studentList');
				text.html("");
				if(result != null){
					text.html(result);
					alert(num);
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
