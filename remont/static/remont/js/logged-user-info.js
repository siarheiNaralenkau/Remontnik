$(function() {
  var messagesDialog = $("#messagesDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Сообщения",
    height: 640,
    width: 640
  });

  function getNewMessages() {
    $.get("/remont/get_new_messages_for_user/", fetchMessages);
  }

  function fetchMessages(responseData) {
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
    var recipientId = $(msgItem).attr("dataPersonId");
    dialogHtml += $("#answerTemplate").html().format(recipientId);
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
    $(msgItem).unbind("click");
    $(".collapse-dialog").on("click", collapseDialog);
    $(".btn-answer").on("click", {msgItem: msgItem}, answerMessage);
  }

  function collapseDialog(event) {
    var dialogSourceEl = this.parentNode.parentNode;
    var sourceHtml = $(dialogSourceEl).attr("dataSourceHtml");
    $(dialogSourceEl).html(sourceHtml);
    $(dialogSourceEl).removeAttr("dataSourceHtml");
    event.stopPropagation();
    $(dialogSourceEl).on("click", loadConversationWithPerson);
  }

  function answerMessage(event) {
    var data = {
      receiver_id: $(event.target).attr("dataRecipientId"),
      message: event.target.parentNode.children[1].children[0].value
    };
    $.post("/remont/answer_mesaage/", data, function(responseData) {
      processAnswerResult(responseData, event.data.msgItem);
    });
  }

  function processAnswerResult(responseData, msgItem) {
    var msgItemTemplate = $("#dialogItemTemplateRight").html();
    var msgDirection = "right";

    var messageHtml = msgItemTemplate.format(
      responseData.sender_logo,
      responseData.sender_name,
      msgDirection,
      responseData.msg_text,
      responseData.was_written
    );
    var newMessageNode = $.parseHTML(messageHtml)[1];
    var firstMessageNode = msgItem.children[2];
    msgItem.insertBefore(newMessageNode, firstMessageNode);
    var messageTextarea = msgItem.getElementsByTagName("textarea")[0];
    messageTextarea.value = "";
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