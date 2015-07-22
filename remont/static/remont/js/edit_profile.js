$(function() {    
    var createAlbumDialog;
    createAlbumDialog = $("#createAlbumDialog").dialog({
        autoOpen: false,
        resizable: false,
        modal: true,
        title: "Создать альбом",
        height: 250,
        width: 400,
        buttons: {
            "Сохранить": createAlbum,
            "Отмена": function() {
                createAlbumDialog.dialog("close");
            }
        },
        close: function() {
            document.forms["createAlbumForm"].reset();
        }
    });


    function handlePhotoSelection(event) {
        var files = event.target.files;
        var previewDiv = document.getElementById("photosPreview");
        previewDiv.innerHTML = "";
        for(var i = 0, f; f = files[i]; i++) {
            if(f.type.match("image.*")) {
                var reader = new FileReader();

                reader.onload = (function(fileObj) {
                    return function(event) {
                        var img = ['<img class="thumb" src="', event.target.result, '" title="', fileObj.name, '"/>'].join('');
                        previewDiv.innerHTML += img;
                    }
                })(f);

                reader.readAsDataURL(f);
            }
        }
        $("#saveImgBtn").removeClass("hidden-input");
        $("#cancelImgBtn").removeClass("hidden-input");
    }

    function cancelFileUpload() {
        $("#photosPreview").html("");
        $("#saveImgBtn").addClass("hidden-input");
        $("#cancelImgBtn").addClass("hidden-input");   
    }

    function createAlbum() {
        var data = {
            "albumName": $("#newAlbumName").val()
        };
        $.post("/remont/create_photo_album/", data, function(data, textStatus, jqXHR) {
            var album = $("#albumTemplate").html();                
            album = album.format(data.id, data.name, data.photos.length);
            $("#albumsList")[0].innerHTML += album;
            createAlbumDialog.dialog("close");
        });        
    }

    function showAlbumCreateDialog() {        
        createAlbumDialog.dialog("open");
    }
    
    $("#uploadPhoto").change(handlePhotoSelection);
    $("#cancelImgBtn").click(cancelFileUpload);
    $("#btnCreateAlbum").click(showAlbumCreateDialog);
});