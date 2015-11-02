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
    var questionMessageEl = this.parentNode.children[1].children[1];
    var questionMessage = questionMessageEl.textContent;
    var questionMessageId = $(questionMessageEl).attr("dataMessageId");
    var senderId = $(this.parentNode.parentNode).attr("dataPersonId");
    $("#curSenderId").html(senderId);
    $("#msgToAnswer").html(questionMessage);
    $("#msgToAnswerId").html(questionMessageId);
    $("#tMessage").val('');
    msgAnswerDialog.dialog("open");
  }

  function answerMessage() {
    var data = {
      receiver_id: $("#curSenderId").html(),
      message: $("#tMessage").val(),
      source_msg_id: $("#msgToAnswerId").html()
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
      var msgTextDisplay;
      var msgText;
      if(msgData.msg_text.length > 140) {
        msgTextDisplay = msgData.msg_text.substring(0, 139) + "...";
        msgText = msgData.msg_text;
      } else {
        msgTextDisplay = msgText = msgData.msg_text;
      }
      var msgItem = "<li class='message-el' dataPersonId='" + msgData.sender_id + "'>" +
        msgTemplate.format(
                            msgData.from_logo,
                            msgData.from_name,
                            msgTextDisplay,
                            msgData.msg_written,
                            msgData.messages_count,
                            msgData.msg_id,
                            msgText
                          )
        + "</li>";

      list.html(list.html() + msgItem);
    }
    $(".answer-btn").on("click", showAnswerMessage);
    $(".message-el").on("click", switchFullMessage);

    var messageAmounts = $(".undead-messages-amount");
    for(var i = 0; i < messageAmounts.length; i++) {
      var amount = $(messageAmounts[i]).html();
      try {
        if(parseInt(amount) > 1) {
          $(messageAmounts[i]).attr("title", "Показать диалог");
          $(messageAmounts[i]).on("click", showConversationWithPerson);
        }
      } catch(e) {}
    }

    showMessagesDialog();
  }

  function showConversationWithPerson() {
    var senderId = $(this).attr("dataPersonId");
    alert("Showing conversation with person which id is: " + senderId + " should be implemented here");
  }

  function showMessagesDialog() {
    messagesDialog.dialog("open");
  }

  function switchFullMessage() {
    var msgTextEl = this.children[0].children[1].children[1];
    var displayText = msgTextEl.textContent;
    var hiddenText = $(msgTextEl).attr("dataHiddenText");
    if(displayText !== hiddenText) {
      msgTextEl.textContent = hiddenText;
      $(msgTextEl).attr("dataHiddenText", displayText);
    }
  }

  $(".new-messages").on("click", getNewMessages);
});