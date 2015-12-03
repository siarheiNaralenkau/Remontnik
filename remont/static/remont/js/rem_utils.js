String.prototype.format = function () {
  var args = arguments;
  return this.replace(/\{(\d+)\}/g, function (m, n) { return args[n]; });
}

function scaleImages() {
  var imgsToScale = $(".scaled");
  for(var i = 0; i < imgsToScale.length; i++) {
    var imgEl = imgsToScale[i];
    var elWidth = $(imgEl).width();
    var scaledHeight = elWidth * 0.75;
    $(imgEl).height(scaledHeight);
  }
}

function checkSpecSelected() {
  $.ajax({
    url: "/remont/check_spec",
    type: "GET",
    async: false,
    cache: false,
    timeout: 2000,
    error: function() {
      return false;
    },
    success: function(responseData) {
      if(responseData.spec_selected === "true") {
        return true;
      } else {
        return false;
      }
    }
  });
}

$(document).ready(scaleImages);
$(window).resize(scaleImages);
