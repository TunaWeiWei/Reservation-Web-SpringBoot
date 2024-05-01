<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>查詢預約頁面</title>

    <!-- jQuery -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

    <!--loginCheck確認登入狀態-->
    <!-- <script src="./JavaScript/loginCheck.js"></script> -->

    <!-- toastr v2.1.4 -->
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" /> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script> -->

    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberShipCenterCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/reservationSearchCSS.css" type="text/css">
</head>

<body>
    <div class="icon-bar">
        <a href="index">
            <img id="home_img" src="./Icon/home.png" alt="首頁">
            <span class="" id="home"></span>
        </a>
        <a id="member_redirect" href="login">
            <img id="login_img" src="./Icon/user.png" alt="會員登入">
            <span class="" id="member">${requestScope.displayText}</span>
        </a>
    </div>

    <div id="bc">
        <div id="title">
            <h1>預約時間查詢</h1>
        </div>
        <form id="reservation_select" method='POST' action="reservationSearch">
            <div>
                <label>預約時間查詢</label>
                <input type="hidden" id="account" name="account" value="${sessionScope.account}" required />
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
                            
                            <c:forEach items="${sessionScope.reservationsSearch}" var="reservationsSearch">
            				<tr>
                				<th>${reservationsSearch.date}</th>
                				<th>${reservationsSearch.customer}</th>
                				<th>${reservationsSearch.eatingTime}</th>
            				</tr>
        					</c:forEach>
                        </thead>
                    </table>
                </fieldset>
            </form>            

        </div>
    </div>

    <!-- 彈出會員登入成功or會員修改成功 -->
    <!-- <script src="./JavaScript/reservationSearch.js"></script> -->

    <!--登入按鈕的文字依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_status.js"></script> -->

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_redirect.js"></script> -->

    <!--登出功能-->
    <!-- <script src="./JavaScript/logout.js"></script>  -->


</body>

</html>