$(function() {
  var messagesDialog = $("#messagesDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Сообщения",
    height: 400,
    width: 500
  });

  function getNewMessages() {
    $.get("/remont/get_new_messages_for_user/", fetchMessages);
  }

  function fetchMessages(responseData) {
    console.log("Messages data: ", responseData);
    showMessagesDialog();
  }

  function showMessagesDialog() {
    messagesDialog.dialog("open");
  }

  $(".new-messages").on("click", getNewMessages);
});