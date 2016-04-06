$(function() {
  $("#showAddFields").click(function() {
    $(".additional-org-data").removeClass("hidden-el");
  });

  $("#hideAddFields").click(function() {
    $(".additional-org-data").addClass("hidden-el");
  });
});