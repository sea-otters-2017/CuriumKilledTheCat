$(document).ready(function(){
  $('body').on('submit', '#login-form', function(e){
    e.preventDefault();
    $this = $(this)
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
})
