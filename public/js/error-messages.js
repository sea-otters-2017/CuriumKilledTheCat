$(document).ready(function(){
  createListener('#inputTitle','.inputTitle')
  createListener('#inputQuestion','.inputContent')
  createListener('#login_password','.inputPassword')
  createListener('#login_username','.inputUsername')
  createListener('#register_password','.inputPassword')
  createListener('#register_username','.inputUsername')
})

createListener = function(toListen, toRemove){
  $(toListen).keyup(function(){
    $(toRemove).remove()
    removeErrors()
  })
}

removeErrors = function(){
  if($('ul.errors li').length == 0){
    $('ul.errors').remove();
  }
}

