$(function() {
  var noSpecDialog = $("#noSpecDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Не выбрана специализация работ",
    height: 320,
    width: 480,
    buttons: {
      "Сохранить": saveSelectedSpec,
      "Отмена": function() {
        noSpecDialog.dialog("close");
      }
    },
    close: function() {
      document.forms["selSpecDialogForm"].reset();
    }
  });

  function saveSelectedSpec() {
    var selSpec = $("#selectSpecInDialog").val();
    $.post("/remont/change_spec_filter/", {"spec": selSpec}, function(responseData) {
      var selectedSpec = $("#selectSpecInDialog").val();
      $("#selSpec").html(selectedSpec);
      $("#workSpec").val(selectedSpec);
      noSpecDialog.dialog("close");
    });
  }

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

  $(".menu-btn").on('click', mainMenuClick);
});

