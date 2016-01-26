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

  var top8Images = $(".top8-scaled");
  for(var i = 0; i < top8Images.length; i++) {
    var imgEl = top8Images[i];
    var elWidth = $(imgEl).width();
    $(imgEl).height(elWidth);
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
