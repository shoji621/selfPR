$(function(){

  function buildHTML(comment) {
    let html =
  `<div class="content">
    <div class="content__upper">
      <div class="content__upper-icon">
        <i class="fas fa-user-alt icon"></i>
      </div>
      <div class="content__upper__right">
        <div class="content__upper__right-name">
          <a class="content__upper__right-name" href="/users/${comment.user_id}">${comment.user_name}</a>
        </div>
        <div class="content__upper__right__status">
          <div class="content__upper__right__status-solved"></div>
          <div class="content__upper__right__status-date">
            ${comment.date}
          </div>
        </div>
      </div>
    </div>
    <div class="content__lower">
      <p class="content__lower__text">${comment.text}</p>
    </div>
  </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');

    $.ajax({  
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments').append(html);
      $('#new_comment')[0].reset();
    })
    .fail(function(){
      alert('エラーが発生したためコメントは送信できませんでした。');
    })
    .always(function() {
      $('.form__btn').prop('disabled', false);
    });
  })
});
