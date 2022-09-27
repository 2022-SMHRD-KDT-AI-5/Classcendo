<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>last demo</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="drop.js"></script>

  <link rel="stylesheet" href="adddel.css">
  <link rel="stylesheet" href="drop.css">

</head>
<body>
    <header class="navbar">
        <div class="navbar__logo">
            <a href="student_record.html">
                <image src="./image/logo_white.png" width="160" height="24">
            </a>
        </div>
        <div class="navbar_center">
            안녕하세요 선생님 :)
        </div>
        <ul class="navbar__menu">
            <li><a href="">마이페이지</a></li>
            <li><a href="">로그아웃</a></li>
        </ul>
        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
    </header>

    <table class="innerbox">
            <td class="innersection">
                <table>
                    <thead>
                        <tr>
                            <th><select class="select_class">
                                <option value="1반">2022년 1학년 1반</option>
                                <option value="2반">2021년 2학년 2반</option>
                                <option value="3반">2020년 3학년 3반</option>
                                </select>
                            </th>
                        </tr>
                    </thead>
                </table>
                <table>
                    <thead>
                        <tr name="trStaff">
                            <th class="firstline">번호</th>
                            <th class="firstline">이름</th>
                            <th class="secondline"><button name="Add_stu" class="Add_stu">학생 추가</button></th>
                            <th class="secondline"><button name="save_stu" class="Add_stu">저장</button></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="textbox" placeholder="번호"></td>
                            <td><input type="text" class="textbox" placeholder="이름"></td>
                            <td><button class="btn_del" name="delStaff">삭제</button></td>
                           
                          
                        </tr>

                    
                    </tbody>
                </table>
                <div id="pop_info_1" class="pop_wrap" style="display:none;">
                    <div class="pop_inner">
                    <p class="dsc">정말 삭제 하시겠습니까?</p>
                    <button type="button" class="btn_yes" onclick="location.href='login.html'">예</button>
                    <button type="button" class="btn_no" onclick="location.href='mypage_1.html'">아니오</button>
                    </div>
                </div>
    </table>
    
<script>
    //추가 버튼
    $(document).on("click","button[name=Add_stu]",function(){
        
        var addStaffText = '<tr name="trStaff">'+
            '        <td>' + '<input type="text"  class="textbox" placeholder="번호">' + '</td>' +
            '        <td>' + '<input type="text"  class="textbox" placeholder="이름">' + '</td>' +
            '        <td>' + '<button class="btn_del" name="delStaff">삭제</button>'+
            '    </td>'+
            '</tr>';
            
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
        
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
        
    });
    
    //삭제 버튼
    $(document).on("click","button[name=delStaff]",function(){
        
        var trHtml = $(this).parent().parent();
        
        trHtml.remove(); //tr 테그 삭제
        
    });
</script>
 
</body>
</html>
