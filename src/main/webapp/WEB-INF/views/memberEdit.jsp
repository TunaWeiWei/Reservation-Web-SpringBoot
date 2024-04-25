<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>會員資料修改</title>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!--loginCheck確認登入狀態-->
    <script src="./JavaScript/loginCheck.js"></script>

    <!-- toastr v2.1.4 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>


    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberShipCenterCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberCRUD_CSS.css" type="text/css">

</head>

<body>
    <div id="bc">

        <div class="icon-bar">
            <a href="index.html">
                <img id="home_img" src="./Icon/home.png" alt="首頁">
                <span class="" id="home"></span>
            </a>
            <a id="member_redirect" href="">
                <img id="login_img" src="./Icon/user.png" alt="會員登入">
                <span class="" id="member"></span>
            </a>
        </div>
        <div id="title">
            <h1>會員資料修改</h1>
        </div>
        <div class="inf">
            <form action="post" id="MemberEdit_sheet">
                <fieldset class="box">

                    <table>
                        <input type="hidden" id="account" name="account" required />
                    </table>

                    <table>
                        <tr>
                            <th>用戶名:</th>
                            <td><input type="text" placeholder="請輸入2-10個字" minlength="2" maxlength="10"
                                    title="請最少輸入2-10個字" id="userName" name="userName" value="" required></td>
                        </tr>
                    </table>

                    <table>
                        <tr>
                            <th>密碼:</th>
                            <td><input type="password" placeholder="請包含英數字混合4~10字內"
                                    pattern="^([a-zA-Z]+\d+|\d+[a-zA-Z]+)[a-zA-Z0-9]*$" minlength="4" maxlength="10"
                                    title="請輸入4-10位英文+數字" id="passWord" name="passWord" value="" required></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <th>年齡:</th>
                            <td><input type="number" placeholder="請以數字輸入" id="age" name="age" value="" required>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <th>電話:</th>
                            <td><input type="text" placeholder="請輸入含區號之電話號碼" pattern="^0([0-9]*$)" minlength="9"
                                    maxlength="10" title="請輸入含區號之電話號碼(例如04xxxxoooo)" id="tel" name="tel" value=""
                                    required></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <th>手機:</th>
                            <td><input type="text" placeholder="請輸入手機號碼" pattern="^09([0-9]*$)" minlength="10"
                                    maxlength="10" title="請輸入手機號碼(例如09xxxxoooo)" id="cellphone" name="cellphone"
                                    value="" required></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <th>電子郵件:</th>
                            <td><input type="email" placeholder="請輸入電子郵件" id="email" name="email" value="" required>
                            </td>
                        </tr>
                    </table>

                    <div class="member-submit-bar">
                        <div class="memberEditSubmit">
                            <button type="submit" id="SubmitButton" value="add"><a>修改</a></button>
                        </div>
                        <div class="memberCreateCancel">
                            <button id="CancelButton"><a class="btn" href="">取消修改</a></button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <!--負責資料上傳至Google Script App的javaScript-->
    <script src="./JavaScript/memberEdit.js"></script>

    <!--登入按鈕的文字依登入狀態做改變-->
    <script src="./JavaScript/loginICON_status.js"></script>

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <script src="./JavaScript/loginICON_redirect.js"></script>

    <!--登出功能-->
    <script src="./JavaScript/logout.js"></script>

    <!---->

    <!-- 彈出會員登入成功or會員修改成功 -->
    <!--
       <script>
        if (UserNameCheck = "${username}") {
            document.getElementById("member").innerText = "你好:" + "${username}";
        } else {
            document.getElementById("member").innerText = "登入/註冊";
        }
    </script>
    <script>
        function memberStatus() {
            if ("${alert}" == "detectSameAccount") {
                toastr.options.timeOut = 3000;
                toastr.info('此帳號已經存在,請再嘗試其他名稱');
            }
        }	
    </script> 
    -->


</body>

</html>