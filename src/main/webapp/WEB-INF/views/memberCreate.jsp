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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>會員創立</title>

    <!-- jQuery -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

    <!-- toastr v2.1.4 -->
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" /> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script> -->


    <!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberShipCenterCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberCRUD_CSS.css" type="text/css">

</head>

<body>
    <div id="bc">        
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
        <h1 style="text-align: center; margin-top: 50px">會員申請</h1>
        <div class="inf">
            <form id="MemberCreate_sheet" method="post" action="memberCreate">
                <fieldset class="box">

                    <table>
                        <tr>
                            <th>帳號:</th>
                            <td><input type="text1" placeholder="請包含英數字混合4~10字內"
                                    pattern="^([a-zA-Z]+\d+|\d+[a-zA-Z]+)[a-zA-Z0-9]*$" minlength="4" maxlength="10"
                                    title="請輸入4-10位英文+數字" id="account" name="account" value="" required></td>
                        </tr>
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
                                    title="請輸入4-10位英文+數字" id="passWord" name="passWord" required></td>
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
                        <div class="memberCreateSubmit">
                            <button type="submit" id="SubmitButton" value="add"><a>申請</a></button>
                        </div>
                        <div class="memberCreateCancel">
                            <button id="CancelButton"><a class="btn" href="">取消申請</a></button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <!--負責資料上傳至Google Script App的javaScript-->
    <!-- <script src="./JavaScript/memberCreate.js"></script> -->

    <!--登入按鈕的文字依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_status.js"></script> -->

    <!--登入按鈕的超連結導向依登入狀態做改變-->
    <!-- <script src="./JavaScript/loginICON_redirect.js"></script> -->

    <!--登出功能-->
    <!-- <script src="./JavaScript/logout.js"></script> -->

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