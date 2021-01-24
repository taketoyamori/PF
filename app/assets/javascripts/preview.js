//画像プレビュー適用箇所
///User側機能
////user新規登録&編集画面
////event新規作成&編集画面
$(function () {
  // inputのidから情報の取得
  $('.image_form').on('change', function (e) {
  // ここから既存の画像のurlの取得
  var reader = new FileReader();
  reader.onload = function (e) {
      $("#img").attr('src', e.target.result);
  }
  // ここまで
  reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
});
});

///管理者機能側
////ブログ新規作成&編集画面
$(function () {
  $('.post-image-form').on('change', function (e) {
  var reader = new FileReader();
  reader.onload = function (e) {
      $("#img").attr('src', e.target.result);
  }
  reader.readAsDataURL(e.target.files[0]);
});
});