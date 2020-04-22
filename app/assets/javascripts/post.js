//----------------------------ページ更新で表示-------------------------------//
window.onload = function () {
  //画像削除用のチェックボックス
  $('.hidden-destroy').hide();
  //保存済み画像数に応じて変更
  let image_num = $('.preview').length;
  if (image_num >= 5) {
    $('.item_imgs').css('display', 'none');
    $('.under_group').css('display', 'block');
    $('.item_imgs_2nd_row').css('display', 'block');
    $('.item_imgs').find('.up-image__group__dropbox').remove();
    $('.item_imgs_2nd_row').prepend(nextInput(image_num+1));
  }
  if (image_num == 10) {
    $('.item_imgs_2nd_row').css('display', 'none');
  }
  
  if ($('#size_box option:selected').val() != "") {
    $('#size_box').css('display', 'block');
  }

  if ($('#postage_type_box option:selected').val() != "") {
    $('#postage_type_box').css('display', 'block');
  }
}
//-----------------------画像のアップロード-----------------------//
  //次の画像アップロード用のinputタグ
  let nextInput = (num)=> {
    let html = `<div class="up-image__group__dropbox" data-index="${num}" index="${num}">
                  <input class="item_imgs__default" 
                  type="file" 
                  multiple= "multiple"
                  accept="image/*"></input></div>`;
    return html; 
  }
  //プレビュー用のimgタグ
  let previewImages = (src)=> {   
    let html = `<div class="preview">
                  <div class="img_box">
                    <img src="${src}" class="preview_image"></div>
                  <div class="preview_btn">削除</div></div>`;
    return html;
  }
  //-------------------------画像プレビュー表示---------------------//
  $(document).on('change','input[type= "file"]', function(e) {

    let reader = new FileReader();  //inputで選択した画像を読み込む
    let file = e.target.files[0];   //inputから1つ目のfileを取得
    reader.readAsDataURL(file);     //inputから画像ファイルのURLを取得

    //画像読み込み完了するとプレビューを表示
    reader.onload = function(e) {
      //inputの画像を付与した,imgタグの塊を.previewsに追加。
      if ($('.preview').length <= 4) {
        $('.previews').append(previewImages(e.target.result));
      } else {
        $('.previews_2nd_row').append(previewImages(e.target.result));
      }

      //プレビュー完了後、プレビュー枚数を数える
      $('.up-image__group__dropbox').removeClass('up-image__group__dropbox').addClass('image-preview');     // jQueryで数を数える用にinputのクラス名変更
      let preview_count = $('.up-image').find('.image-preview').length; //プレビューの数を数える

      //アップロード完了したら、inputタグを追加
      if (preview_count <= 4) {
        $('.item_imgs').prepend(nextInput(preview_count + 1));
      } else {
        $('.item_imgs_2nd_row').prepend(nextInput(preview_count + 1));
      }

      //文字列を消す
      $('.image_text_message').css('display', 'none');
      //エラーメッセージを消す
      $('.img_error_message').css('display', 'none');

      //プレビュー画像が５枚になったら１段目inputを消し、２段目にinputを表示
      if (preview_count == 5) {
        $('.item_imgs').css('display', 'none');
        $('.under_group').css('display', 'block');
        $('.item_imgs_2nd_row').css('display', 'block');
      }
      //プレビュー画像が10枚になったら2段目inputを消す
      if (preview_count == 10) {
        $('.item_imgs_2nd_row').css('display', 'none');
      }

      //inputの最後の"data-image"を取得し、input nameの番号を更新。inputの区別のため。
      //全部のプレビューの番号を更新し、削除しても番号が並ぶ。
      $('.item_imgs__default').each(function(i) {
        $(this).attr('name', "item[item_imgs_attributes][" + (i+1) + "][src]");
        $(this).attr('data-index', (i+1));
      });
      $('.preview').each(function(i) {
        $(this).attr('data-index', (i+1));
      });
      $('.image-preview').each(function(i) {
        $(this).attr('index', (i+1));
        $(this).attr('data-index', (i+1));
      });
    }
  });

  //-----------------------削除ボタンをクリック--------------------//
  $(document).on("click",'.preview_btn', function() {
    // 該当indexを振られているチェックボックスを取得
    let targetIndex = $(this).parent().data("name");
    let hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    $(this).parent().remove();  //削除ボタンを押した.previewを削除
    // チェックボックスが存在すればチェックを入れる
    if (hiddenCheck) {
      hiddenCheck.prop('checked', true)
    } else {
      let preview_num = $(this).parent().attr('data-index');  //削除ボタンのプレビューNo.を取得
      //該当No.のinputタグを取得して、親ごと削除
      $('.image-preview[data-index ='+preview_num+']').remove();
      let preview_count = $('.up-image').find('.image-preview').length; //プレビューの数を数える
      //inputの番号をつけ直す
      $('.item_imgs__default').each(function(i) {
        $(this).attr('name', "item[item_imgs_attributes][" + (i+1) + "][src]");
        $(this).attr('data-index', (i+1));
      });
      $('.preview').each(function(i) {
        $(this).attr('data-index', (i+1));
      });
      $('.image-preview').each(function(i) {
        $(this).attr('index', (i+1));
        $(this).attr('data-index', (i+1));
      });

      if (preview_count == 4) {
        $('.item_imgs_2nd_row').find('.up-image__group__dropbox').remove();
        $('.item_imgs').prepend(nextInput(preview_count + 1));
        $('.item_imgs_2nd_row').css('display', 'none');
        $('.item_imgs').css('display', 'block');
        $('.image_text_message').css('display', 'none');
      } else if (preview_count <=8 && preview_num <= 5) {
        $('.preview[data-index ='+5+']').appendTo('.previews');
        $('.image-preview[data-index ='+5+']').appendTo('.item_imgs');
      } else if (preview_count == 9) {
        $('.item_imgs_2nd_row').css('display', 'block');
        if(preview_num <= 5) {
          $('.preview[data-index ='+5+']').appendTo('.previews');
          $('.image-preview[data-index ='+5+']').appendTo('.item_imgs');
        }
      }
    }
    if ($(".preview").length == 0) {
      //文字列を表示
      $('.image_text_message').css('display', 'block');
      //エラーメッセージを表示
      $('.img_error_message').css('display', 'block');
    }
  });