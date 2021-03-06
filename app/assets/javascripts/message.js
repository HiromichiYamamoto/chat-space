$(function() {

  function buildHTML(message){
    var insertImage = '';
    if (message.image.url) {
      insertImage = `<img src="${message.image.url}">`;
    }
    var html = `<div class="main__body-message-list" data-message-id = #{message.id}>
                  <div class="main__body-message-list-upper">
                    <div class="main__body-message-list-upper-name">${message.name}</div>
                    <div class="main__body-message-list-upper-time">${message.created_at}</div>
                  </div>
                  <div class="main__body-message-list-lower">
                    <div class="main__body--message-list-lower-body">
                    ${message.body}
                    ${insertImage}
                    </div>
                  </div>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main__body-message').append(html)
      $('.main__body').animate({scrollTop: $('.main__body-message').height()}, 2000);
      $('.text_field').val('')
      $('#message_image').val('')
    })
    .fail(function(){
      alert('error');
    })
    $('#send_button').removeAttr('data-disable-with');
  })
})
