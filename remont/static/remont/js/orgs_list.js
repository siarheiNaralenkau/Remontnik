$(function() {

  $(".org-item-container").on("click", clickProfile);

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
      width: 14,
      height: 14,
      shape: 'STAR',
      min: 0,
      max: 5,
      precision: 0.5,
      horizontal: true
    });
  }

  function clickProfile() {
    var orgId = $(this).attr("dataOrgId");
    var profileUrl = "/remont/view_profile?org_id=" + orgId;
    window.open(profileUrl, "_self");
  }

});
