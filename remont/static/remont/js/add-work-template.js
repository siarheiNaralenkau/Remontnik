$(function(){
  $("#jobCategoryMenu").menu({
    select: jobTypeSelect
  });

  $(".jobs-for-category").hide();

  $("#jobTypeBtn").click(showMenu);
  $("#btnSuggestJob").click(showSuggestForm);

  function showMenu() {
    $("#jobCategoryMenu").removeClass("hidden-el");
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
});
