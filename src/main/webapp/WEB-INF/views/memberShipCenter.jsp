<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>會員頁面</title>

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

</head>

<body onload="">
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
    <div class="member-functions-bar">
        <div class="ed">
            <span id="Edit"><a class="btn" href="memberEdit">會員資料修改</a></span>
        </div>
        <div class="reservationSearch">
            <span id="buttonPress"><a class="btn" href="reservationSearch">查詢預約紀錄</a></span>
        </div>
        <div class="log">
            <span id="Logout"><a class="btn" href="">登出</a></span> <!--需要加JS去處理登出資料-->
        </div>
    </div>
    <div id="bc">
        <div id="title">
            <h1>會員中心</h1>
        </div>
        <div class="inf">

            <form>
                <fieldset class="box">
                    <table>
                        <tr>
                            <th>姓名:</th>
                            <td id="username"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
            <form>
                <fieldset class="box">
                    <table>
                        <tr>
                            <th>年齡:</th>
                            <td id="age"></td>
                        </tr>
                    </table>
                </fieldset>

            </form>
            <form>
                <fieldset class="box">
                    <table>
                        <tr>
                            <th>電話:</th>
                            <td id="tel"></td>
                        </tr>
                    </table>
                </fieldset>

            </form>
            <form>
                <fieldset class="box">
                    <table>
                        <tr>
                            <th>手機:</th>
                            <td id="cellphone"></td>
                        </tr>
                    </table>
                </fieldset>

            </form>
            <form>
                <fieldset class="box">
                    <table>
                        <tr>
                            <th>電子郵件:</th>
                            <td id="email"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>

    <!--從登入成功後收到的存入session內之回傳值將其取出並顯示於頁面上-->
    <script src="./JavaScript/memberShipCenter.js"></script>

    <!--登入按鈕的文字依登入狀態做改變-->
    <script src="./JavaScript/loginICON_status.js"></script>

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <script src="./JavaScript/loginICON_redirect.js"></script>

    <!--登出功能-->
    <script src="./JavaScript/logout.js"></script>

    <!-- 彈出會員登入成功or會員修改成功(待施工) -->





</body>

</html>