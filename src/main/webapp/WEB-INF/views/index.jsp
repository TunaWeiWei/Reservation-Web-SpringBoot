<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//此為從登入成功後收到的存入session內之回傳值將其取出並顯示於頁面上

    String username = (String) session.getAttribute("username");
    String displayText = "登入/註冊";
    
    if (session.getAttribute("loginCheck") == null) {
    	System.out.println("登入狀態為未登入");
    	
    } else if(session.getAttribute("loginCheck").equals("success")) {
    	displayText = "你好: " + username;      
    	System.out.println("登入狀態正常");
    	
    }else {
    	System.out.println("登入狀態判定有問題");
      
    }
    // 將準備好的消息存入 request scope中，供後續使用
    request.setAttribute("displayText", displayText);
    
%>
<!DOCTYPE html>
<html>

<head>
    <!-- jQuery -->
    <!--  --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- toastr v2.1.4 -->
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" /> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script> -->

    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/indexCSS.css" type="text/css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>TunaWei餐廳訂位網</title>
</head>

<body>
    <div>
        <div class="icon-bar">
            <a href="index">
                <img id="home_img" src="./Icon/home.png" alt="首頁">
                <span class="" id="home"></span>
            </a>
            <a id="member_redirect" href="login">
                <img id="login_img" src="./Icon/user.png" alt="會員登入">
                <span class="" id="member">${requestScope.displayText}</span>  <!-- 此處放入經java判斷session後的結果 -->
            </a>
        </div>
        <img id="index_img" src="./Image/rumman-amin-nKs-oXRGGEg-unsplash.jpg" alt="首頁圖">
        <div class="textContent">
            <a href="introduction">
                <button class="text">TunaWei餐廳介紹</button>
            </a>
            <a href="service">
                <button class="text">立即預約</button>
            </a>
            <a href="memberShipCenter">
                <button class="text">會員中心</button>
            </a>

        </div>
    </div>
    <div class="textContent">
        <a href="https://www.flaticon.com/free-icons/user" title="user icons">User icons created by Freepik -
            Flaticon</a>
        <a href="https://www.flaticon.com/free-icons/home-button" title="home button icons">Home button icons created by
            Freepik - Flaticon</a>
    </div>

    
    <!--登入按鈕的文字依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_status.js"></script> -->

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_redirect.js"></script> -->

    <!--登出功能-->
    <!-- <script src="./JavaScript/logout.js"></script> -->

</body>

</html>