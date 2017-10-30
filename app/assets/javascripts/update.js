
$(function(){

  function buildHTML(message) {
  var insertImage = '';
  if (message.image.url) {
    insertImage = `<img src="${message.image.url}">`;
  }
  var html = `<div class="main__body-message-list" data-message-id = ${message.id}>
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
  return html
  }
  $(window).on('load', function(){
  setInterval(function(){
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      type: 'GET',
      url: location.href,
      dataType: 'json'
    })
    .done(function(messages) {
      var id = $('.main__body-message-list').last().attr('data-message-id');
      var insertHTML = '';;
      messages.forEach(function(message) {
      if(message.id > id){
        insertHTML += buildHTML(message);
      }
      });
      $('.main__body-message').append(insertHTML);
      $('.main__body').animate({scrollTop: $('.main__body-message').height()}, 2000);
    })
    .fail(function(messages) {
      alert('自動更新に失敗しました');
    });
    } else {
      clearInterval(interval);
    }},5000 );
  });
});

