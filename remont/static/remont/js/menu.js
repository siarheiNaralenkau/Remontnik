var noSpecDialog;

$(function() {
  var noSpecDialog = $("#noSpecDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Не выбрана специализация работ",
    height: 320,
    width: 480
  });

  function mainMenuClick() {
    var link = $(this).attr("dataLink");
    if(link === "/remont/orgs_list") {
      var selSpec = $("#selSpec").html();
      if(selSpec) {
        window.open(link, "_self");
      } else {
        noSpecDialog.dialog("open");
      }
    } else if(link) {
      window.open(link, "_self");
    } else {
      alert("Данный функционал еще не реализован :(");
    }
  }

  $(".action-btn").on('click', mainMenuClick);
});

