$(function() {

  function returnToMainPage() {
    window.location.replace("/remont");
  }

  function gotoRegister() {
    window.location.replace("/remont/register");
  }

  $(".site-logo").click(returnToMainPage);
  $("#registerLink").click(gotoRegister);
});