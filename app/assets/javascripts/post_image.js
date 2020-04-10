// $(function(){
//   $fileField = $('#post_image')
 
//   // 選択された画像を取得し表示
//   $($fileField).on('change', $fileField, function(e) {
//     file = e.target.files[0]
//     reader = new FileReader(),
//     $preview = $("#preview");
 
//     reader.onload = (function(file) {
//       return function(e) {
//         $preview.empty();
//         $preview.append($('<img>').attr({
//           src: e.target.result,
//           width: "100%",
//           class: "preview",
//           title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });

// $(function() {
//   function readURL(input) {
//     if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {
//         $('#preview').attr('src', e.target.result);
//       }
//       reader.readAsDataURL(input.files[0]);
//     }
//   }
//   $("#post_image").change(function(){
//     readURL(this);
//   });
//  });