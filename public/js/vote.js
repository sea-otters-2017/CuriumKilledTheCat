$(document).ready(function() {
  $('.vote-button-container').on('submit', '.wrap-vote-button', function(event) {
    event.preventDefault();
    alert('Listening on vote-button-container');
    var url = $(event.target).closest('form').attr('action');
    $.ajax({
      type: 'POST',
      url: url,
      data: "{vote_count: 1}",
      dataType: "text",
      success: function(resultData){
          alert("Success");
      }
    })
  })
  
});