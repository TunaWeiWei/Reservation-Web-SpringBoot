<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//此項為確認連線者是否有通過帳號認證連進來 否則退回到登入頁面 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
	
	if (session.getAttribute("loginCheck") == null ){
		System.out.println("未登入故轉至login頁面(預約頁面)");
		response.sendRedirect("login");
	}else if(session.getAttribute("loginCheck").equals("failed")){
		System.out.println("loginCheck 回傳值為failed(預約頁面)");
		response.sendRedirect("login");
	}else if(session.getAttribute("loginCheck").equals("success") ){		
		System.out.println("成功進入預約頁面(預約頁面)");
	}else{
		System.out.println("其他問題(預約頁面)");
	}
%>	
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
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

    <!--loginCheck確認登入狀態-->
    <!-- <script src="./JavaScript/loginCheck.js"></script> -->

    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>預約頁面</title>
</head>

<body class="light">>

    <div>
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
        <h1>預約頁面</h1>
        <div class="inf">
            <form method='POST' action="service" >
                <fieldset class="box">

                    <table>
                        <input type="hidden" id="account" name="account" value="${sessionScope.account}" required />
                        <input type="hidden" id="userName" name="userName" value="${sessionScope.username}" required />
                    </table>

                    <table>
                        <tr>
                            <th>預約人數:</th>
                            <td><input type="radio" name="customer" value="1" required>1人
                                <input type="radio" name="customer" value="2">2人
                                <input type="radio" name="customer" value="3">3人
                                <input type="radio" name="customer" value="4">4人
                            </td>
                        </tr>
                    </table>

                    <table>
                        <tr>
                            <th>預約日期:</th>
                            <td><input type="date" id="date" name="date" required>日期</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <th>預約用餐時間:</th>
                            <td><input type="radio" name="eatingTime" value="noon" required>午餐
                                <input type="radio" name="eatingTime" value="afternoon">下午茶
                                <input type="radio" name="eatingTime" value="night">晚餐
                            </td>
                        </tr>
                    </table>

                    <div class="ReservationSubmit">
                        <button type="submit" id="SubmitButton"><a class="btn">預約確認</a></button>
                    </div>
                    <div class="memberEditCancel">
                        <button id="CancelButton"><a class="btn" href="memberShipCenter">取消修改</a></button>
                    </div>

                </fieldset>
            </form>
        </div>
    </div>

    <div>
        <a href="index.html">
            <h1>回首頁</h1>
        </a>
    </div>

    <!--負責資料上傳至Google Script App的javaScript-->
    <!-- <script src="./JavaScript/service.js"></script> -->

    <!--登入按鈕的文字依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_status.js"></script> -->

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_redirect.js"></script> -->

    <!--登出功能-->
    <!-- <script src="./JavaScript/logout.js"></script> -->
</body>

</html>