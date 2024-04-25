$(document).ready(function () {

    var loginCheck = sessionStorage.getItem('loginCheck')
    if (loginCheck == 'success') {
        $("#member_redirect").attr("href", "memberShipCenter");
    } else {
        $("#member_redirect").attr("href", "login");
    }
})