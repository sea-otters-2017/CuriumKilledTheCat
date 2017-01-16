$(document).ready(function() {
  $('#answers-list').on('submit', '.wrap-vote-button', function(event) {
    event.preventDefault()
    alert('Listening on vote button')

    var url = $(event.target).attr('action')   
    var hidden_field = $(event.target).find("input[type='hidden']")
    var data = { vote_count: hidden_field.val() }
    var parent = $(event.target).closest('.wrap-vote-button')
    var dataTarget = $(parent).find('.vote-count')

    $.ajax({
      type: 'POST',
      url: url,
      data: data,
      dataType: "text",
      success: function(response){
        console.log(dataTarget)
        $(dataTarget).html(response)
      }
    })
  })
});