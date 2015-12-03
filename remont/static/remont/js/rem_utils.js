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

$(document).ready(scaleImages);
$(window).resize(scaleImages);
