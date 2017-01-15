$(document).ready(function() {
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();
      var questionId = ($(this).children().prop('id'))
      $.ajax({
        type: 'GET',
        url: '/new_answer/' + questionId
      }).done(function(data){
        $(this).addClass('hidden');
        $("#ajax-answer").append(data);
      }).error(function(response) {
        alert('You must be logged in to leave an answer')
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
        var paraContent = '<p><strong>' + data.content + '</strong></p>';
        $('.answers-count').text(data.answer_count + ' Answers');
        $('#answers-list').append(paraContent);
        $('.answer-form').remove();
        $('#new-answer-button').removeClass('hidden');
      })
    });

    $("#event-listener").on('click', '#new-comment-button', function(event) {
      event.preventDefault();
      var answerId = ($(this).closest('div').prop('id'))
      var $this = $(this)
      $.ajax({
        type: 'GET',
        url: '/new_comment/' + answerId
      }).done(function(data){
        console.log('this', $this)
        $this.parent().addClass('hidden');
        $("#".concat(answerId)).append(data);
      }).error(function(response) {
        alert('You must be logged in to leave an answer')
      })
    });


    $("#event-listener").on('submit', '#new-comment-form', function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      var answerId = ($(this).closest('div.comment-wrapper').prop('id'));

      $.ajax({
        type: 'POST',
        url:'/answers/'+ answerId + '/new',
        data: data
      }).done(function(data){
        var liContent = '<li>' + data.content + '</li>';
        $('#comments-' + answerId).append(liContent);
        $('.comment-form').remove();
        $('#new-comment-form-button').removeClass('hidden');
      }).error(function(data){
        alert('comment can\'t be left blank')
      })
    });

});
