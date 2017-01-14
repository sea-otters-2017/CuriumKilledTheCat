$(document).ready(function() {
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();
      var questionId = ($(this).children().prop('id'))
      $(this).addClass('hidden');
      $.ajax({
        type: 'GET',
        url: '/new_answer/' + questionId
      }).done(function(data){
        
      })
    });

    $("event-listener").on('submit', '#new-answer-form', function(event) {

    });

});
