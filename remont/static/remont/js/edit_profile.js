$(function() {
    function openFileDialog() {
        $("#uploadPhoto").trigger('click');
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
                        var img = ['<img class="thumb" src="', event.target.result, '" title="', fileObj.name, '"/>'].join('');
                        previewDiv.innerHTML += img;
                    }
                })(f);

                reader.readAsDataURL(f);
            }
        }
    }

    $("#selectBtn").click(openFileDialog);
    $("#uploadPhoto").change(handlePhotoSelection);
});