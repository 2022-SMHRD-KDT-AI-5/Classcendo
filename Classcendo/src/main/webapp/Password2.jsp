<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="Login.css" rel="stylesheet">
    <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
    <style>
        body{
            background: url('./Image/passwordbg.png') no-repeat center;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <form action="student_record.html" class="login-form">
            <img src="./Image/logo_white.png" alt="" width="500" height="65"><br><br>

            <div class="textb">
                <input type="password" class="form-control" id="floatingInput" placeholder="New Password">
            </div>

            <div class="textb">
                <input type="password" class="form-control" id="floatingInput" placeholder="New Password Confirm">
            </div>

            <div class = "Passwordbtn">
                <button class="btnfind" type="button" onclick="location.href='login.html'">Check</button>
            </div>
     
        </form>


    <script src="assets/js/main.js"></script>
</body> 
</html>  