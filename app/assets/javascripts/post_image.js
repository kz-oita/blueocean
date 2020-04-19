
$(function(){
  $fileField = $('#post_image')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#preview");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// $(function(){
//   var cropper;
//   var croppable = false;
//   function initIconCrop(){
//     cropper = new Cropper(crop_img, {
//       dragMode: 'move',
//       aspectRatio: 1,
//       restore: false,
//       guides: false,
//       center: false,
//       highlight: false,
//       cropBoxMovable: false,
//       cropBoxResizable: false,
//       minCropBoxWidth: 280,
//       minCropBoxHeight: 280,
//       ready: function(){
//         croppable = true;
//       }
//     });
//   }
// });