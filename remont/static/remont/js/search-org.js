$(function() {
  var searchResultsDialog = $("#searchResultsDlg").dialog({
    autoOpen: false,
    resizable: false,
    modal: false,
    title: "Результаты поиска",
    height: 500,
    width: 400,
  });

  $("#searchBtn").click(searchOrgs);

  function searchOrgs() {
    searchResultsDialog.dialog("close");
    var keyWords = $("#searchKeyword").val();
    $.get("/remont/search_organizations", {keyWords: keyWords}, processSearchResult);
  }

  function processSearchResult(responseData) {
    console.log(responseData);
    var orgsList = $("#listOrgs");
    orgsList.html("");
    for(var i = 0; i < responseData.length; i++) {
      var orgItem = responseData[i];
      var listItem =
        "<li class='search-item'>" +
        "<a href='/remont/view_profile?org_id=" + orgItem.id + "'>" +
        "<img class='search-img' src='" + orgItem.logo + "'/>" +
        "<span class='search-name'>" + orgItem.name + "</span>" +
        "</a></li>";
      orgsList.html(orgsList.html() + listItem);
    }
    var keyWordsEl = $("#searchKeyword");
    var x = keyWordsEl.position().left;
    var y = keyWordsEl.position().top - $(document).scrollTop();
    searchResultsDialog.dialog("option", "position",
      {
        my: "left top",
        at: "left bottom",
        of: keyWordsEl
      });
    searchResultsDialog.dialog("open");
  }
});