String.prototype.format = function () {
    var args = arguments;
    return this.replace(/\{(\d+)\}/g, function (m, n) { return args[n]; });
}

function sendLoginRequest() {
    var data = {
        'login': $("#login").val(),
        'password': $("#password").val()
    };
    $.post("/remont/login/", data, loginResult)
}

function loginResult(responseData, textStatus, jqXHR) {
    console.log("Login status: " + responseData.status);
}

function categoryChanged() {
    var categoryId = $(this).val();
    $.get('/remont/get_job_types_by_category?category_id=' + categoryId,
        function(data) {
            console.log(data);
            $('#job_type').children('option:not(:first)').remove();
            for(var i = 0; i < data.length; i++) {
                $('#job_type')
                     .append($("<option></option>")
                     .attr("value",data[i].id)
                     .text(data[i].name));
            }
        }
    );
}

function saveJobRequest() {
    var data = {
        'job_header': $(".job_header").first().val(),
        'job_category': $(".job_category").first().val(),
        'job_type': $(".job_type").first().val(),
        'job_description': $(".job_description").first().val(),
        'contact_name': $(".contact_name").first().val(),
        'job_city': $(".job_city").first().val(),
        'contact_phone': $(".contact_phone").first().val(),
        'contact_mail': $(".contact_mail").first().val()
    };
    $.post('/remont/suggest_job_save_ajax/', data, refreshJobs)
}

function refreshJobs(data, textStatus, jqXHR) {
    var jobRequestsList = $('.job-requests-list').first()
    var jobsHtml = jobRequestsList.html()
    var newSuggestionHtml = '<li><div class="job-request-div"><h3>{0}</h3><h5>{1}</h5><div><span>{2}</span><p>{3}</p></div></div></li>'
            .format(data.header, data.type_name, data.date_created, data.description)
    var newHtml = newSuggestionHtml + jobsHtml;
    jobRequestsList.html(newHtml);
    $('.suggest-job-form')[0].reset();
}

$(function() {
    var loginDialog;

    $("#job_category").change(categoryChanged);
    $(".place-job-request-btn").click(saveJobRequest);

    // Add search:
    $(".searchInput").autocomplete({
        source: function( request, response ) {
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
        },
        minLength: 5,
        select: function(event, ui) {
            // Forward to organization profile review...
            console.log("Selected: " + ui);
            window.open("/remont/org_profile?org=" + ui.item.value, "_blank");
        }
    });

    loginDialog = $("#loginDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Вход",
        height: 300,
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

    // Функция отображает диалог для ввода логина и пароля.
    function showLoginDialog() {
        loginDialog.dialog("open");
    }

    $("#loginLink").on('click', showLoginDialog);
});
