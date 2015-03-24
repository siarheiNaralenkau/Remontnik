$(document).ready(function() {
    $("#id_logo").change(handleLogoSelect);
});

function handleLogoSelect(evt) {
    var logoFile = evt.target.files[0];
    document.getElementById("previewDiv").innerHTML = '';
    if(logoFile.type.match("image.*")) {
        var reader = new FileReader();
        reader.onload = (function(theFile) {
            return function(e) {
                var imgPreview = ['<img class="thumb" src="', e.target.result, '" title="', theFile.name, '"/>'].join('');
                document.getElementById("previewDiv").innerHTML = document.getElementById("previewDiv").innerHTML + imgPreview;
            }
        })(logoFile);

        reader.readAsDataURL(logoFile);
    }
};
