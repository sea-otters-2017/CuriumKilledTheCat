$(document).ready(function() {
  $('#event-listener').on('submit', '.wrap-vote-button', function(event) {
    event.preventDefault()

    var url = $(event.target).attr('action')
    var hidden_field = $(event.target).find("input[type='hidden']")
    var data = { vote_count: hidden_field.val() }
    var parent = $(event.target).closest('.wrap-vote-button')
    var dataTarget = $(parent).find('.vote-count')

    if (data.vote_count == '1') {
      $(event.target).find('.vote-button').toggleClass('upvote')
      $(parent).find('.arrow-down').removeClass('downvote')
    } else {
      $(event.target).find('.vote-button').toggleClass('downvote')
      $(parent).find('.arrow-up').removeClass('upvote')
    }


    $.ajax({
      type: 'POST',
      url: url,
      data: data,
      dataType: "text",
      success: function(response){
        $(dataTarget).html(response)
      }
    }).error(function(response) {
        alert('you must be logged in to vote')
    })
  })
});
