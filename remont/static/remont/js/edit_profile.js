$(function() {
    function openFileDialog() {
        $("#uploadPhoto").trigger('click');
    }

    function handlePhotoSelection(event) {
        var files = event.target.files;
        alert("Files amount: " + files.length);
    }

    $("#selectBtn").click(openFileDialog);
    $("#uploadPhoto").change(handlePhotoSelection);
});