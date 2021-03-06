$(document).ready(function(){
  // コメントが一つも存在しなければ、comments__containerクラスを削除する。
  if ($('#comments__container > li').length == 0) {
    $('#comments__container').removeClass('comments__container')
  }

  $(function(){
    function buildHTML(comment){
      let html = `<li class='comment'>
                    <a href="#" class='comment__link'>
                      <img class='comment__link__user-icon' src='https://static.mercdn.net/images/member_photo_noimage_thumb.png'>
                      <div class='comment__link__user-name'>
                        ${comment.user_name}
                      </div>
                    </a>
                    <div class='comment__content'>
                      <div class='comment__content__text'>
                        ${comment.comment}
                      </div>
                      <div class='comment__content__bottom'>
                        <div class='comment__content__bottom__date'>
                          <div class='comment__content__bottom__date__icon'>
                            <i class="fa fa-clock-o" />
                          </div>
                          <div class='comment__content__bottom__date__time'>
                            今
                          </div>
                        </div>
                        <div class='comment__content__bottom__report'>
                          <i class="fa fa-flag-o" />
                        </div>
                      </div>
                    </div>
                  </li>`

    return html;
    };

    function getCommentsContainer() {
      let html = `<ul class="comments__container">
                  </ul>`
      return html;
    }

    $('#comment-form__form').on('submit', function(e){
      e.preventDefault();
      let formData = new FormData(this);
      let url = $(this).attr('action');
      $.ajax({
        type: 'POST',
        url: url,
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(comment){
        let html = buildHTML(comment);
        $('#comments__container').addClass('comments__container');
        $('.comments__container').append(html);
        $('#comment-form__form')[0].reset();
      })
      .fail(function(){
        alert('文字を入力して下さい');
      })
      .always(function(){
        $('.comment-form__submit').removeAttr('disabled');
      })
    })
  });
});
