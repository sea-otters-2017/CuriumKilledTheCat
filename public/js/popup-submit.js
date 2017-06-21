var noBlank = '<ul class="flash" id="no-blank"><li>Don\'t leave username or password blank.</li></ul>'

$(document).ready(function(){
  checkPopUp('login')
  checkPopUp('register')
})

checkPopUp = function(form) {
  var timeout = null

  $('body').on('submit', '#popup-' + form + '-form', function(e){
    e.preventDefault();

    clearTimeout(timeout)
    $('#popup-flash').html('')
    $this = $(this)

    var errors = checkForm(form)
    if (errors) {
      $('#popup-flash').append(noBlank)
      timeout = setTimeout(function(){$('#no-blank').remove()},2000)
      return;
    }

    $.ajax({
      type: 'post',
      url: $this.attr('action'),
      data: $this.serialize()
    }).done(function(data){
      location.reload()
    }).error(function(error){
      $('#popup-flash').append(error.responseText)
    })
  })
}

checkForm = function(form){
  var passwordError = checkInput('#' + form + '_password')
  var usernameError = checkInput('#'+ form + '_username')
  return (passwordError || usernameError)
}

checkInput = function(toCheck){
  var error = false
  var $input = $(toCheck)
  var input = $input.val()
  if (!input) {
    $input.addClass('bad-input')
    createPopUpListener($input)
    error = true
  }
  return error
}

createPopUpListener = function(toListen){
  toListen.keyup(function(){
    toListen.removeClass('bad-input')
  })
}

