$(function() {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".menu_item");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // let formData = new FormData(this);
    // let url = $(this).attr('action');
    // $.ajax({
    //   url: url,
    //   type: 'GET',
    //   data: formData,
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false,
    //   timeout: 10000
    // })
    // .done(function(data){
    //   let html = buildHTML(data);
    //   $('.messages').append(html);
    //   $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight},'fast');
    //   $('form')[0].reset();
    // })
    // .fail(function() {
    //   alert('非同期通信に失敗しました');
    // })
    // .always(function() {
    //   $('.form__submit').removeAttr("disabled");
    // });


    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");
    // クリックしたタブにactiveクラスを追加
    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたcoutentクラスにshowクラスを追加する
    $(".content").removeClass("show").eq(index).addClass("show");
  }

  tabs.click(tabSwitch);
});

$(function() {
  console.log($(".menu_item"));
});

