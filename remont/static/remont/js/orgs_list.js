$(function() {

  $(".org-item-container").on("click", clickProfile);
  $("#searchKeyword").on("keyup", filterOrgs);
  $("#searchKeyword").val($("#nameStarts").text());

  var ratingElems = $(".org-item-rating");
  for(var i = 0; i < ratingElems.length; i++) {
    var ratingValueS = $(ratingElems[i]).attr("dataRating");
    var ratingValue = +ratingValueS;
    var elId = "#rating" + $(ratingElems[i]).attr("dataOrgId");
    $(elId).jRate({
      readOnly: true,
      startColor: "#FFFF33",
      endColor: "#FFFF33",
      rating: ratingValue,
      width: 13,
      height: 13,
      shape: 'STAR',
      min: 0,
      max: 5,
      precision: 0.5,
      horizontal: true,
      backgroundColor: "#F0F0F0"
    });
  }

  function clickProfile() {
    var orgId = $(this).attr("dataOrgId");
    var profileUrl = "/remont/view_profile?org_id=" + orgId;
    window.open(profileUrl, "_self");
  }

  function filterOrgs() {
    var inputText = $.trim($("#searchKeyword").val());
    var prevValue = $("#namePrevValue").text();
    var link = "";
    console.log(inputText);
    if(inputText !== prevValue) {
      $("#namePrevValue").text(inputText);
      if(inputText.length == 0) {
        link = "/remont/orgs_list";
        window.open(link, "_self");
      } else if(inputText.length > 2)  {
        link = "/remont/orgs_list?nameStarts=" + inputText;
        window.open(link, "_self");
      } else {
        return;
      }
    }
  }

});
