<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!--驗證使用者是否為登入狀態-->
    <script src="./JavaScript/loginCheck_loginPage.js"></script>

    <!-- toastr v2.1.4 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberShipCenterCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberCRUD_CSS.css" type="text/css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入頁面</title>
</head>

<body onload="memberStatus()">
    <div class="icon-bar">
        <a href="index">
            <img id="home_img" src="./Icon/home.png" alt="首頁">
            <span class="" id="home"></span>
        </a>
        <a id="member_redirect" href="">
            <img id="login_img" src="./Icon/user.png" alt="會員登入">
            <span class="" id="member"></span>
        </a>
    </div>
    <h1 style="text-align: center; margin-top: 50px">登入您的帳號</h1>
    <form action="post" id="Login_sheet">
        <fieldset class=member>
            <div class="mem">
                <label>會員帳號:</label>
                <input type="text" placeholder="輸入帳號" id="account" name="account"><br />
            </div>
            <div class="mem">
                <label>會員密碼:</label>
                <input type="password" placeholder="輸入密碼" id="passWord" name="passWord"><br />
            </div>

            <div class="member-submit-bar">
                <div class="mem1">
                    <button id="create"><a href="memberCreate" style="text-decoration: none;">註冊新會員</a></button>
                </div>
                <div class="mem1">
                    <button type="submit" id="SubmitButton"><a class="btn">登入</a></button>
                </div>

            </div>
        </fieldset>
    </form>

    <script src="./JavaScript/login.js"></script>



    <!--登入按鈕的文字依登入狀態做改變-->
    <script src="./JavaScript/loginICON_status.js"></script>

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <script src="./JavaScript/loginICON_redirect.js"></script>

    <!--登出功能-->
    <script src="./JavaScript/logout.js"></script>

    <!-- 彈出帳號申請成功提醒 -->
    <script>
        function memberStatus() {
            var memberStatus = sessionStorage.getItem('userData')
            if (memberStatus == '"會員成功申請"') {
                toastr.options = {
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-left",
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "3000"
                }
                toastr.success('會員申請成功');

                //清除userData的暫存以免後續回到此頁面會跳出不合當下狀況的通知
                var userData = sessionStorage.removeItem("userData")
            };
        }	
    </script>

</body>



</html>