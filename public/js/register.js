/// if registration gets more complex than login, implement this file

// var noBlank = '<ul class="flash" id="no-blank"><li>Don\'t leave username or password blank.</li></ul>'

// $(document).ready(function(){

//   var timeout = null

//   $('body').on('submit', '#register-form', function(e){
//     e.preventDefault();

//     clearTimeout(timeout)
//     $('#popup-flash').html('')
//     $this = $(this)

//     var errors = checkForm('register')
//     if (errors) {
//       $('#popup-flash').append(noBlank)
//       timeout = setTimeout(function(){$('#no-blank').remove()},2000)
//       return;
//     }

//     $.ajax({
//       type: 'post',
//       url: $this.attr('action'),
//       data: $this.serialize()
//     }).done(function(data){
//       location.reload()
//     }).error(function(error){
//       $('#popup-flash').append(error.responseText)
//     })
//   })
// })

// // checkForm = function(){
// //   var passwordError = checkInput('#register_password')
// //   var usernameError = checkInput('#register_username')
// //   return (passwordError || usernameError)
// // }

// // checkInput = function(toCheck){
// //   var error = false
// //   var $input = $(toCheck)
// //   var input = $input.val()
// //   if (!input) {
// //     $input.addClass('bad-input')
// //     createPopUpListener($input)
// //     error = true
// //   }
// //   return error
// // }

// // createPopUpListener = function(toListen){
// //   toListen.keyup(function(){
// //     toListen.removeClass('bad-input')
// //   })
// // }

