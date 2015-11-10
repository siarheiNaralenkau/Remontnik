$(function() {
  var messagesDialog = $("#messagesDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Сообщения",
    height: 640,
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
    $(".message-el").on("click", loadConversationWithPerson);

    showMessagesDialog();
  }

  function loadConversationWithPerson() {
    var messageItem = this;
    var senderId = $(this).attr("dataPersonId");
    $.get("/remont/get_dialogs_history/", {dialog_partner: senderId}, function(responseData) {
      showConversation(responseData, messageItem);
    });
  }

  function showConversation(responseData, msgItem) {
    var userId = parseInt($("#userId").html());
    var msgItemTemplate;
    var sourceHtml = $(msgItem).html();
    var dialogHeader = $("#dialogHeaderTemplate").html().format(responseData[0].sender_name, responseData[0].receiver_name);
    var dialogHtml = dialogHeader;
    dialogHtml += $("#answerTemplate").html();
    var msgDirection;
    for(var i = 0; i < responseData.length; i++) {
      if(userId === responseData[i].sender_id) {
        msgItemTemplate = $("#dialogItemTemplateRight").html();
        msgDirection = "right";
      } else {
        msgItemTemplate = $("#dialogItemTemplateLeft").html();
        msgDirection = "left";
      }
      var messageHtml = msgItemTemplate.format(
        responseData[i].sender_logo,
        responseData[i].sender_name,
        msgDirection,
        responseData[i].msg_text,
        responseData[i].was_written
      );
      dialogHtml += messageHtml;
    }
    dialogHtml += $("#collapseDialogTemplate").html();
    $(msgItem).html(dialogHtml);
    $(msgItem).attr("dataSourceHtml", sourceHtml);
    $(".collapse-dialog").on("click", collapseDialog);
  }

  function collapseDialog(event) {
    var dialogSourceEl = this.parentNode.parentNode;
    var sourceHtml = $(dialogSourceEl).attr("dataSourceHtml");
    $(dialogSourceEl).html(sourceHtml);
    $(dialogSourceEl).removeAttr("dataSourceHtml");
    event.stopPropagation();
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