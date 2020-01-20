$(function(){

  function buildHTML(comment) {
    let current_user_id = $('.current_user_id').val();
    let delete_btn = (current_user_id == comment.user_id && !comment.solved)  ? `<a data-confirm="削除してよろしいですか？" class="postManage__delete postManage__delete__comment" data-remote="true" rel="nofollow" data-method="delete" href="/posts/${comment.post_id}/comments/${comment.id}">削除</a>` : " " ;
    let html =
  `<div class="content" id="comment-${comment.id}">
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
            ${delete_btn}
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
