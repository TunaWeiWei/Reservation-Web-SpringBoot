<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>查詢預約頁面</title>

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
    <link rel="stylesheet" href="./CSS/reservationSearchCSS.css" type="text/css">
</head>

<body>
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

    <div id="bc">
        <div id="title">
            <h1>預約時間查詢</h1>
        </div>
        <form id="reservation_select">
            <div>
                <label>預約時間查詢</label>
                <select>
                    <option value="">ALL</option>
                    <option value="1">一個月內</option>
                    <option value="2">兩個月內</option>
                    <option value="3">三個月內</option>
                </select>
                <input type="submit" id="" value="查詢">

            </div>
        </form>


        <div class="inf">

            <form>
                <fieldset class="box">
                    <table>
                        <thead>
                            <tr>
                                <th id="form_title">預約日期</th>
                                <th id="form_title">預約人數</th>
                                <th id="form_title">預約時段</th>
                            </tr>
                        </thead>
                    </table>
                </fieldset>
            </form>
            <form>
                <fieldset class="box">
                    <table>
                        <tbody id="reservation_Search_Data"></tbody>
                    </table>
                </fieldset>
            </form>

        </div>
    </div>

    <!-- 彈出會員登入成功or會員修改成功 -->
    <script src="./JavaScript/reservationSearch.js"></script>

    <!--登入按鈕的文字依登入狀態做改變-->
    <script src="./JavaScript/loginICON_status.js"></script>

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <script src="./JavaScript/loginICON_redirect.js"></script>

    <!--登出功能-->
    <script src="./JavaScript/logout.js"></script>


</body>

</html>