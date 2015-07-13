$(function() {
    var orgId = $("#orgId").text();
    console.log("Selected organization id: ", orgId);
    $.get("/remont/get_profile_info", {org_id: orgId}, function(data) {
        console.log("Org profile info: ", data);
        $("#orgName").text(data.name);
        $("#orgLogo").attr("src", "/remont/" + data.logo_url);
        $("#orgRating").jRate({
            readOnly: true,
            startColor: "orange",
            endColor: "orange",
            rating: data.rating,
            width: 25,
            height: 25,
            shape: 'STAR',
            min: 0,
            max: 5,
            precision: 0.5,
            horizontal: true
        });

        var collegs = document.getElementById("collegsList");
        var collegsFragment = document.createDocumentFragment();
        for(var i = 0; i < data.collegues.length; i++) {
            var collegItem = document.createElement("li");
            collegItem.setAttribute("class", "colleg-item");
            
            var collegImg = document.createElement("img");
            collegImg.setAttribute("src", "/remont/" + data.collegues[i].logo_url);
            collegImg.setAttribute("class", "colleg-logo");
            collegItem.appendChild(collegImg);
            
            var collegName = document.createElement("span");
            collegName.setAttribute("class", "colleg-name");
            collegName.innerHTML = data.collegues[i].name;
            collegItem.appendChild(collegName);            

            collegsFragment.appendChild(collegItem);
        }
        collegs.appendChild(collegsFragment);
    }, "json");
});