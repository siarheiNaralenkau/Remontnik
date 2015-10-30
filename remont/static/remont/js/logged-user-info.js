$(function() {
  var messagesDialog = $("#messagesDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Сообщения",
    height: 480,
    width: 640
  });

  var msgAnswerDialog = $("#msgAnswerDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Ответить на сообщение",
    height: 440,
    width: 580,
    buttons: {
      "Ответить": answerMessage
    }
  });

  function getNewMessages() {
    $.get("/remont/get_new_messages_for_user/", fetchMessages);
  }

  function showAnswerMessage(event) {
    event.stopPropagation();
    var questionMessage = this.parentNode.children[1].children[1].textContent;
    var senderId = $(this.parentNode.parentNode).attr("dataPersonId");
    $("#curSenderId").html(senderId);
    $("#msgToAnswer").html(questionMessage);
    $("#tMessage").val('');
    msgAnswerDialog.dialog("open");
  }

  function answerMessage() {
    var data = {
      receiver_id: $("#curSenderId").html(),
      message: $("#tMessage").val()
    }
    $.post("/remont/answer_mesaage/", data, processAnswerResult);
  }

  function processAnswerResult(responseData) {
    console.log("Response Data: ", responseData);
    msgAnswerDialog.dialog("close");
  }

  function fetchMessages(responseData) {
    console.log("Messages data: ", responseData);
    var list = $("#messagesList");
    list.html("");
    for(var i = 0; i < responseData.length; i++) {
      var msgData = responseData[i];
      var msgTemplate = $("#personMsgTemplate").html();
      var msgItem = "<li class='message-el' dataPersonId='" + msgData.sender_id + "'>" +
        msgTemplate.format(msgData.from_logo, msgData.from_name, msgData.msg_text, msgData.msg_written, msgData.messages_count) + "</li>";
      list.html(list.html() + msgItem);
    }
    $(".answer-btn").on("click", showAnswerMessage);
    $(".message-el").on("click", showConversationWithPerson);
    showMessagesDialog();
  }

  function showConversationWithPerson() {
    var senderId = $(this).attr("dataPersonId");
    alert("Showing conversation with person which id is: " + senderId + " should be implemented here");
  }

  function showMessagesDialog() {
    messagesDialog.dialog("open");
  }

  $(".new-messages").on("click", getNewMessages);
});