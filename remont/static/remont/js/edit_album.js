$(function() {     
    var uploadPhotoDlg = $("#photoUploadDialog").dialog({
        autoOpen: false,
        resizable: true,
        modal: true,
        title: "Добавить фотографии в альбом",
        height: 600,
        width: 800,
        buttons: [
            { 
                id: "btnSave",
                text: "Сохранить",
                click: saveAlbum            
            }
        ],
        close: function() {
            document.forms["uploadPhotoForm"].reset();
            document.getElementById("#photosPreview").innerHTML = "";
        }
    });
    $("#btnSave").button("disable");

    function saveAlbum() {
        document.forms["uploadPhotoForm"].submit();
    }

    function deletePhoto() {        
        var element = this;
        var photoId = $(this).attr("data-photo-id");
        $.post("/remont/delete_photo/", {"photo_id": photoId}, function(data) {                    
            $(element.parentNode).remove();
        });        
    }

    function uploadPhotos() {
        uploadPhotoDlg.dialog("open");
    }   

    function handlePhotoSelection(event) {
        var files = event.target.files;
        var previewDiv = document.getElementById("photosPreview");
        previewDiv.innerHTML = "";
        for(var i = 0, f; f = files[i]; i++) {
            if(f.type.match("image.*")) {
                var reader = new FileReader();

                reader.onload = (function(fileObj) {
                    return function(event) {
                        var img = ['<img class="img-thumb" src="', event.target.result, '" title="', fileObj.name, '"/>'].join('');
                        previewDiv.innerHTML += img;
                    }
                })(f);

                reader.readAsDataURL(f);
            }
        }
        $("#btnSave").button("enable");
    }

    $(".photo-delete").click(deletePhoto);
    $("#btnAddPhotos").click(uploadPhotos);
    $("#uploadPhoto").change(handlePhotoSelection);
});