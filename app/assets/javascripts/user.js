$(function() {
// ユーザー検索該当あり
function appendUser(user) {
  var user_list = $("#user-search-result");
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}" id="addbutton" >追加</a>
              </div>`
  user_list.append(html)
}
// ユーザー検索該当なし
function appendNoUser(user) {
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name"></p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="" data-user-name="" id="button" >追加</a>
              </div>`
    search_list.append(html)
}
//ユーザーをグループに追加
function addUserToGroup(user) {
  var user_member = $("#group-users-list");
  var userName = $(user).attr('data-user-name')
  var userId = $(user).attr('data-user-id')
  var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${userId}'>
                <input name='group[user_ids][]' type='hidden' value='${userId}'>
                <p class='chat-group-user__name'>${userName}</p>
                <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' id='deleteButton' data-user-id='${userId}' data-user-name='${userName}'>削除</a>
              </div>`
  user_member.append(html)
}

$(document).on('turbolinks:load', function() {
  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      $("#user-search-result").empty();
    if (users.length !== 0) {
       users.forEach(function(user){
         appendUser(user);
      });
    }else{
      appendNoUser("一致するユーザーはいません");
      }
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
    })
  });
});
// 第二要素の追加
  $(document).on("click", "#addbutton", function(){
    var clicked_user = $(this).parent();
// 削除
    clicked_user.remove();
    addUserToGroup($(this));
  });
// 削除ボタン
  $(document).on("click","#deleteButton",function(){
    var clicked_user = $(this).parent();
    clicked_user.remove();
  });

});
