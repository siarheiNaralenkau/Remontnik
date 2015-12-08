$(function() {
  var loginDialog, setPasswordDialog, partnersRequestDialog, noSpecDialog;

  // Add search:
  $(".searchInput").autocomplete({
    source: function( request, response ) {
      var selSpec = $("#selSpec").html();
      if(!selSpec) {
        noSpecDialog.dialog("open");
      } else {
        $.ajax({
          url: "/remont/search_organizations",
          data: {
            q: request.term
          },
          success: function(result) {
            console.log(result);
            response(result);
          }
        });
      }
    },
    minLength: 3,
    select: function(event, ui) {
      // Forward to organization profile review...
      console.log("Selected organization: " + ui.item.name);
      window.open("/remont/view_profile?org_id=" + ui.item.id, "_blank");
    }
  }).
  autocomplete("instance")._renderItem = function(ul, item) {
    var result = $("<li class='search-item'>")
    .append("<a href='/remont/view_profile?org_id=" + item.id + "'>")
    .append("<img class='search-img' src='" + item.logo + "'/>")
    .append("<span class='search-name'>" + item.name + "</span>")
    .append("</a></li>");
    return result.appendTo(ul);
  };

  loginDialog = $("#loginDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Вход",
    height: 285,
    width: 500,
    buttons: {
      "Войти": sendLoginRequest,
      "Отмена": function() {
        loginDialog.dialog( "close" );
      }
    },
    close: function() {
      document.forms["loginForm"].reset();
    }
  });

  setPasswordDialog = $("#setPasswordDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Создание пароля",
    height: 270,
    width: 500,
    buttons: {
      "Сохранить пароль": sendSetPasswordRequest
    },
    close: function() {
      document.forms["createPassword"].reset();
    }
  });

  partnersRequestDialog = $("#partnersRequestDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Запросы на добавление в партнеры",
    height: 400,
    width: 500
  });

  noSpecDialog = $("#noSpecDialog").dialog({
    autoOpen: false,
    resizable: false,
    modal: true,
    title: "Не выбрана специализация работ",
    height: 320,
    width: 480
  });

  // Создание нового предложения по работе.
  function saveJobRequest() {
    var selSpec = $("#selSpec").html();
    if(!selSpec) {
      noSpecDialog.dialog("open");
    } else {
      var description = $.trim($(".job_description").first().val());
      var data = {
        'job_header': $(".job_header").first().val(),
        'job_category': $("#jobCategory").val(),
        'job_type': $("#jobType").val(),
        'job_description': description,
        'contact_name': $(".contact_name").first().val(),
        'job_city': $(".job_city").first().val(),
        'contact_phone': $(".contact_phone").first().val(),
        'contact_mail': $(".contact_mail").first().val()
      };
      $.post('/remont/suggest_job_save_ajax/', data, refreshJobs);
    }
  }

  // Функция отображает диалог для ввода логина и пароля.
  function showLoginDialog() {
    loginDialog.dialog("open");
  }

  function showPartnersDialog() {
    partnersRequestDialog.dialog("open");
  }

  function sendLoginRequest() {
    var data = {
      'login': $("#login").val(),
      'password': $("#password").val()
    };
    $.post("/remont/site_login/", data, loginResult);
  }

  function sendSetPasswordRequest() {
    var data = {
      'login': $("#passwordOrgName").val(),
      'password': $("#firstPassword").val()
    };
    $.post("/remont/set_password/", data, setPasswordResult);
  }

  function loginResult(responseData, textStatus, jqXHR) {
    console.log("Login status: " + responseData.status);
    if(responseData.status === "success") {
      loginDialog.dialog("close");
      $("#loginError").text("");
      window.location.replace("/remont");
    } else {
      $("#loginError").text(responseData.error_message);
    }
  }

  function setPasswordResult(responseData, textStatus, jqXHR) {
    console.log(responseData);
    if(responseData.status == "success") {
      window.location.replace("/remont/org_profile?org=" + responseData.org_id);
    }
  }

  function logout() {
    window.location.replace("/remont/site_logout");
  }

  function editProfile() {
    window.location.replace("/remont/edit_organization/" + $("#userId").text());
  }

  function logSuccess(responseData, textStatus) {
    console.log("Response status: " + responseData.status);
  }

  function approvePartner() {
    var senderId = $(this).attr("data-orgId");
    var data = {
      'senderId': senderId
    };
    $.post("/remont/approve_partner/", data, function() {
      $("#" + senderId).remove();
      updatePartnersAmount(-1);
    });
  }

  function rejectPartner() {
    var senderId = $(this).attr("data-orgId");
    $.post("/remont/reject_partner/", {'senderId': $(this).attr("data-orgId")}, function() {
      $("#" + senderId).remove();
      updatePartnersAmount(-1);
    });
  }

  // Function changes the label about new partner requests
  function updatePartnersAmount(diff) {
    var partnersAmount = parseInt($("#partnersAmount").html());
    partnersAmount = partnersAmount + diff;
    $("#partnersAmount").html(partnersAmount);
  }

  function changeSpec() {
    $.post("/remont/change_spec_filter/", {"spec": $(this).val()}, function(responseData) {
      console.log("Job Spec filter change status: " + responseData.status);
      var selectedSpec = $("#workSpec").val();
      $("#selSpec").html(selectedSpec);
    });
  }

  function refreshJobs(data, textStatus, jqXHR) {
    var jobRequestsList = $('.job-requests-list').first();
    var jobsHtml = jobRequestsList.html();
    var dateFormatter = new Intl.DateTimeFormat("ru",
      {year: "numeric", month: "long", day: "numeric", hour: "numeric", minute: "numeric"});
    var dateString = dateFormatter.format(new Date());
    var newSuggestionHtml = '<li><div class="job-request-div"><h3>{0}</h3><h5>{1}</h5><div><span>{2}</span><p>{3}</p></div></div></li>'
        .format(data.header, data.type_name, dateString, data.description);
    var newHtml = newSuggestionHtml + jobsHtml;
    jobRequestsList.html(newHtml);
    $('.suggest-job-form')[0].reset();
  }

  function viewProfile() {
    var orgId = $(this).attr("dataOrgId");
    window.location.replace("/remont/view_profile?org_id=" + orgId);
  }

  $("#loginLink").on('click', showLoginDialog);
  $("#exitBtn").on('click', logout);
  $("#editProfileBtn").on('click', editProfile);
  $(".new-partners").on('click', showPartnersDialog);
  $(".add-partner").on('click', approvePartner);
  $(".reject-partner").on('click', rejectPartner);
  $("#workSpec").on("change", changeSpec);
  $(".place-job-request-btn").on('click', saveJobRequest);
  $(".top-orgs-child").on('click', viewProfile);

  var ratings = $(".top-rating");
  for(var i = 0; i < ratings.length; i++) {
    var ratingEl = ratings[i];
    var ratingValue = +$(ratingEl).attr("dataRating");
    var ratingElId = "#" + $(ratingEl).attr("id");

    $(ratingElId).jRate({
      readOnly: true,
      startColor: "#CCCC33",
      endColor: "#CCCC33",
      rating: ratingValue,
      width: 12.5,
      height: 12.5,
      shape: 'STAR',
      min: 0,
      max: 5,
      precision: 0.5,
      horizontal: true
    });
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
