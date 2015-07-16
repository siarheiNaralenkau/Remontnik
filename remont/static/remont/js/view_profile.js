$(function() {
    var sendMsgDialog = $("#messageDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Написать сообщение",
        height: 400,
        width: 550,
        buttons: {
            "Отправить": sendMessage
        },
        close: function() {
            document.forms["messageForm"].reset();
        }
    });

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

        // Fill collegues list
        var collegs = document.getElementById("collegsList");
        var collegsFragment = document.createDocumentFragment();
        for(var i = 0; i < data.collegues.length; i++) {
            var collegItem = document.createElement("li");
            collegItem.setAttribute("class", "colleg-item");
            collegItem.setAttribute("data-orgid", data.collegues[i].id);
            
            var collegImg = document.createElement("img");
            collegImg.setAttribute("src", "/remont/" + data.collegues[i].logo_url);
            collegImg.setAttribute("class", "colleg-logo");
            collegItem.appendChild(collegImg);
            
            var collegName = document.createElement("span");
            collegName.setAttribute("class", "colleg-name");
            collegName.innerHTML = data.collegues[i].name;
            collegItem.appendChild(collegName);         

            $(collegItem).click(viewFriendOrg);   

            collegsFragment.appendChild(collegItem);
        }
        collegs.appendChild(collegsFragment);

        // Fill job types;
        var jobTypesDiv = $("#jobTypes");
        var jobsFragment = document.createDocumentFragment();
        for(var i = 0; i < data.job_types.length; i++) {
            var jobItem = document.createElement("span");
            $(jobItem).attr("class", "job-type");
            jobItem.innerHTML = data.job_types[i];
            if(i >= 3) {
                $(jobItem).addClass("hidden");
            }
            jobsFragment.appendChild(jobItem);            
        }
        if(data.job_types.length > 3) {
            var showMore = document.createElement("span");
            $(showMore).addClass("show-more-jobs");
            $(showMore).text("подробнее..");
            $(showMore).click(showMoreJobs);
            jobsFragment.appendChild(showMore);
        }
        jobTypesDiv[0].appendChild(jobsFragment);

        // Fill contacts info        
        var contactsFragment = document.createDocumentFragment();
        for(var i = 0; i < data.contacts.length; i++) {
            var contactItem = document.createElement("li");
            $(contactItem).addClass("contacts-item");
            $(contactItem).text(data.contacts[i]);
            contactsFragment.appendChild(contactItem);
        }
        $("#contacts")[0].appendChild(contactsFragment);

        $("#orgAddress").text(data.address);
        $("#showMap").click(showOnMap);

        $("#aboutCompany").text(data.about);

        // Load photos
        $("#photosHeader").text(data.photos.length + ' Фотографий');
        var photoFragment = document.createDocumentFragment();
        for(var i = 0; i < data.photos.length; i++) {
            var imgLink = document.createElement("a");
            $(imgLink).attr("href", "/remont/" + data.photos[i]);
            var photoImg = document.createElement("img");
            $(photoImg).attr("src", "/remont/" + data.photos[i]);            
            $(photoImg).addClass("work-image");                  
            imgLink.appendChild(photoImg);      
            photoFragment.appendChild(imgLink);
        }
        $("#photos")[0].appendChild(photoFragment);        
    }, "json");

    function showMoreJobs() {        
        $("#jobTypes > span.job-type").each(function() {
            $(this).removeClass("hidden");
        });
        $(".show-more-jobs").text("Свернуть");        
        $(".show-more-jobs").unbind();
        $(".show-more-jobs").click(collapseJobs);
    }

    function collapseJobs() {
        $("#jobTypes > span.job-type").each(function(index) {
            if(index >= 3) {
                $(this).addClass("hidden");
            }
        });
        $(".show-more-jobs").text("подробнее..");        
        $(".show-more-jobs").unbind();
        $(".show-more-jobs").click(showMoreJobs);
    }

    function showOnMap() {
        $(this).text("Скрыть карту");
        $(this).unbind();
        $(this).click(hideMap);
        $("#addressMap").removeClass("hidden");
        var address = $("#orgAddress").text();
        var geocoder = ymaps.geocode(address);
        geocoder.then(
            function(res) {
                var geoObjects = res.geoObjects.get(0);
                var geometry = geoObjects.geometry;
                var coordinates = geometry.getCoordinates();
                var map = new ymaps.Map("addressMap", {
                    center: coordinates,
                    zoom: 12
                });
                var placemark = new ymaps.Placemark(coordinates, 
                    {balloonContent: address},
                    {preset: 'islands#dotIcon', iconColor: '#735184'}
                );
                map.geoObjects.add(placemark);
            },
            function (err) {
                console.log("Не удалось получить координаты объекта по адресу: " + address);
            }
        );        
    }

    function showMap() {
        $(this).text("Скрыть карту");
        $(this).unbind();
        $(this).click(hideMap);
        $("#addressMap").removeClass("hidden");
    }

    function hideMap() {
        $(this).text("показать на карте");
        $(this).unbind();
        $(this).click(showMap);
        $("#addressMap").addClass("hidden");
    }

    function viewFriendOrg() {
        var orgId = $(this).attr("data-orgid");
        var url = "/remont/view_profile?org_id=" + orgId;
        window.open(url, "_self");
    }

    function sendMessage() {
        var data = {
            org_id: $("#org_id").val(),
            message: $("#tMessage").val()
        }
        $.post("/remont/send_text_mesaage/", data, sendMessageResult);
    }

    function sendMessageResult(responseData, textStatus, jqXHR) {
        console.log("Send message result: " + responseData);
        if(responseData.status === "success") {
            sendMsgDialog.dialog("close");
            $("#msgError").text("");
        } else {
            $("#msgError").text(responseData.error_message);
        }
    }

    $("#btnSendMsg").click(function() {
        sendMsgDialog.dialog("open");
    });
});