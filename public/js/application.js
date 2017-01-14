$(document).ready(function() {
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();
      var questionId = ($(this).children().prop('id'))
      $(this).addClass('hidden');
      $.ajax({
        type: 'GET',
        url: '/new_answer/' + questionId
      }).done(function(data){
        $("#ajax-answer").append(data);
      }).error(function(response) {
        $('.question-container').remove();
        $('#event-listener').append(response.responseText);
      })
    });

    $("#event-listener").on('submit', '#new-answer-form', function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      var questionId = ($(this).children('button').prop('id'));
      $.ajax({
        type: 'POST',
        url:'/questions/'+ questionId + '/answers',
        data: data
      }).done(function(data){
        console.log(data);
        var html = '<p><strong>' + data.content + '</strong></p>';
        $('#answers-list').append(html);
        $('.answer-form').remove();
        $('#new-answer-button').removeClass('hidden');
      })
    });
});
