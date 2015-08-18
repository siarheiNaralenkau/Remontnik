$(function() {
  $(".companyMenuItem").click(switchShowedData);
  $(".album-item").click(showWorkImagesGallery);
});

function switchShowedData() {
  if( $(this).hasClass("companyMenuActive")) {
    return;
  } else {
    $(".companyMenuItem").removeClass("companyMenuActive");
    $(this).addClass("companyMenuActive");

    var visibleSectionId = "#" + $(this).attr("data-alias");
    $(".profileSection").addClass("hidden");
    $(visibleSectionId).removeClass("hidden");
  }
}

function showWorkImagesGallery() {
    // Загружаем фотографии для альбома с сервера.
    $('#albumPhotosList').empty();
    var albumId = $(this).attr("data-album-id");
    var imgRoot = "/remont/";
    $.get('/remont/get_album_photos?album_id=' + albumId,
      function(data) {
        console.log(data);
        for(var i = 0; i < data.length; i++) {
          var photoItem = $("<a></a>").attr({href: imgRoot + data[i].url});
          photoItem.append($("<img/>").attr({src: imgRoot + data[i].url, style: "width: 77px; height: 77px"}));
          $('#albumPhotosList').append(photoItem);
        }
        var photoBox = $('#albumPhotosList').photobox('a', {autoplay: true});
        var images = $("#albumPhotosList").children();
        var firstImg = images.get(0);
        $(firstImg).trigger("click");

        var closeBtn = $("#pbCloseBtn");
        closeBtn.click(function () {
          $('#albumPhotosList').empty();
        });
      }
      );
  }