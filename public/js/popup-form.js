$(document).ready(function(){
  $('.login-list-item').click(handleListClick)
  $('.register-list-item').click(handleListClick)
})

function clearPopUp(event){
  event.preventDefault();
  $('.blackout').remove();
  $('.popup-form').remove();
}

function handleListClick(event){
    event.preventDefault();
    $('.dropdown').click();

    $('#main-wrapper').prepend('<div class="blackout"></div>');
    setTimeout(function(){
      $('.blackout').addClass('fade-in-blackout');
    }, 10)

    var url = $(event.target).attr('href')
    $.ajax({
      type: 'GET',
      url: url,
    }).done(function(response){
      $('#main-wrapper').append(response);
      $('.blackout').click(clearPopUp);
      $('.cancel-button').click(clearPopUp);
    })
}
