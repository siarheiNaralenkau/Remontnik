$(function(){
  $("#jobCategoryMenu").menu({
    select: jobTypeSelect
  });

  $("#jobTypeBtn").click(showMenu);

  function showMenu() {
    $("#jobCategoryMenu").removeClass("hidden-el");
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
    }
  }
});
