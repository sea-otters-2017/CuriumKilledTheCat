$(document).ready(function() {
  $('.vote-button-container').on('submit', '.wrap-vote-button', function(event) {
    event.preventDefault();
    alert('Listening on vote-button-container');
    var url = $(event.target).closest('form').attr('action');
    var hidden_field = $(event.target).find("input[name='vote-count']");
    var data = { vote_count: hidden_field.val() };
    console.log(data);

    $.ajax({
      type: 'POST',
      url: url,
      data: data,
      dataType: "text",
      success: function(resultData){
          alert("Success");
      }
    })
  })
  
});