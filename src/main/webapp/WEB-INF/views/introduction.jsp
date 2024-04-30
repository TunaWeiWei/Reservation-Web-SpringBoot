<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我是介紹</title>

<!-- CSS -->
    <link rel="stylesheet" href="./CSS/basicCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberShipCenterCSS.css" type="text/css">
    <link rel="stylesheet" href="./CSS/memberCRUD_CSS.css" type="text/css">

</head>
<body>
	<form method='POST' action="loginCheck" >
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
    
    
    
    <div>測試有無資料</div>
    <p>Login Check: ${sessionScope.loginCheck}</p>
    <p>user_account: ${sessionScope.account}</p>
    <p>username: ${sessionScope.username}</p>
    <p>age: ${sessionScope.age}</p>
    <p>tel: ${sessionScope.tel}</p>
    <p>cellphone: ${sessionScope.cellphone}</p>
    <p>email: ${sessionScope.email}</p>

</body>
</html>