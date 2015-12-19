$(function(){
  $("#jobCategoryMenu").menu({
    select: jobTypeSelect
  });

  var deviceType = $("#deviceType").html();
  if(deviceType === "mobile") {
    $("#jobTypeBtn").click(showMenu);
    $(".job-menu-item").click(showSubMenu);
  } else {
    $("#jobTypeBtn").mouseover(showMenu);
  }

  $("#btnSuggestJob").click(showSuggestForm);

  function showMenu() {
    $("#jobCategoryMenu").removeClass("hidden-el");
  }

  function showSubMenu() {
    var subMenuList = $(this).find("ul");
    subMenuList.show();
  }

  function showSuggestForm() {
    $(".place-job-container").removeClass("hidden-el");
    $("#btnSuggestJob").addClass("hidden-el");
  }

  function jobTypeSelect(event, ui) {
    var selectedEl = ui.item[0];
    if($(selectedEl).hasClass("job-type")) {
      var jobTypeId = $(selectedEl).attr("dataJobId");
      $("#jobType").val(jobTypeId);
      var categoryEl = selectedEl.parentNode.parentNode;
      var categoryId = $(categoryEl).attr("dataCatId");
      $("#jobCategory").val(categoryId);
      console.log(jobTypeId);
      $("#jobCategoryMenu").addClass("hidden-el");
    } else {
      var subMenu = $(selectedEl).find(".jobs-for-category");
      $(subMenu).show();
    }
  }

  // Прячем меню при нажатии мыши где либо за его пределами.
  var jobMenuEl = $("#jobCategoryMenu");
  $(document).click(function(e) {
    var clickedEl = $(e.target);
    if(!$.contains(jobMenuEl, clickedEl) && !clickedEl.hasClass("show-menu-btn")) {
      jobMenuEl.addClass("hidden-el");
    }
  });
});
