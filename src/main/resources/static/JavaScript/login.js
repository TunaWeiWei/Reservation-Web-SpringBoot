var script_url = "https://script.google.com/macros/s/AKfycbwzCP8-Vc8F3PRbNXUhYfo8QavsWp7LpWu4HhleqvzX1MmD__y2sCZC0-BNAbjGg79G/exec";
$(document).ready(function () {
    $("#Login_sheet").submit(function (event) {
        event.preventDefault();


        $('#account, #passWord').prop("disabled", true);

        var account = $("#account").val();
        var passWord = $("#passWord").val();

        var url = script_url +
            "?account=" + account +
            "&passWord=" + passWord +
            "&action=Login_Submit";

        var request = $.ajax({
            url: url,
            type: "POST",

            //將回傳值存入session storage內讓後續頁面可以再運用
            success: function (response) {
                sessionStorage.setItem("loginCheck", response.loginCheck);
                sessionStorage.setItem("account", account);
                sessionStorage.setItem("username", response.username);
                sessionStorage.setItem("age", response.age);
                sessionStorage.setItem("tel", response.tel);
                sessionStorage.setItem("cellphone", response.cellphone);
                sessionStorage.setItem("email", response.email);


                window.location.href = "index";
            },
            error: function (thrownError) {
                console.log(thrownError);
                window.location.reload();
            }

        });
        request.done(function (response, textStatus, jqXHR) {
            alert("傳送完成");

            //將回傳值存入session storage內讓後續頁面可以再運用 2/1改由success及error處執行
            //   sessionStorage.setItem("userData", JSON.stringify(response));
            //   window.location.href = "index.html";

        });
        request.always(function () {
            $('#account, #userName, #customer, #date, #eatingTime').prop("disabled", true);

        });
        event.preventDefault();
    })
})