$(document).ready(function() {
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();

      var questionId = ($(this).children().prop('id'))
      $this = $(this)

      $.ajax({
        type: 'GET',
        url: '/new_answer/' + questionId

      }).done(function(data){
        $this.addClass('hidden');
        $("#ajax-answer").append(data);
        $('#new-answer-form').children('textarea').focus();

      }).error(function(response) {
        alert('You must be logged in to leave an answer')
      })
    });

    $("#event-listener").on('submit', '#new-answer-form', function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      var questionId = ($(this).children('div').children('.submit-answer').prop('id'));

      $.ajax({
        type: 'POST',
        url:'/questions/'+ questionId + '/answers',
        data: data

      }).done(function(data){

        $('#answers-list').append(data);
        $('.answer-form').remove();
        $('#new-answer-button').removeClass('hidden');

      }).error(function(data){
        alert('answer field cannot be left blank')

      })
    });

    $('#event-listener').on('click', '.cancel', function(event){
      event.preventDefault();
      $('.answer-form').remove();
      $('#new-answer-button').removeClass('hidden');
    })

    $("#event-listener").on('click', '#new-comment-button', function(event) {
      event.preventDefault();
      $('.comment-form').remove();
      $('.new-comment-form-button').removeClass('hidden');
      var answerId = ($(this).closest('div').prop('id'))
      var $this = $(this)

      $.ajax({
        type: 'GET',
        url: '/new_comment/' + answerId

      }).done(function(data){
        $this.parent().addClass('hidden');
        $("#".concat(answerId)).append(data);
        $('#new-comment-form').children('textarea').focus();

      }).error(function(response) {
        alert('You must be logged in to leave a comment')
      })
    });


    $("#event-listener").on('submit', '#new-comment-form', function(event) {
      event.preventDefault();
      var data = $(this).serialize();
      var answerId = ($(this).closest('div.new-comment-wrapper').prop('id'));

      $.ajax({
        type: 'POST',
        url:'/answers/'+ answerId + '/new',
        data: data
      }).done(function(data){

        var table = '#comments-' + answerId
        $(table).append(data);

        $('.comment-form').remove();
        $('.new-comment-form-button').removeClass('hidden');

      }).error(function(data){
        alert('comment can\'t be left blank')
      })
    });

    $('.login-list-item').on('click', function(event){
      event.preventDefault();
      $.ajax({
        type: 'GET',
        url: '/login_ajax'
      }).done(function(response){
        $('body').append(response);
      })
    })

    $('body').on('click', '#new_user_cancel', function(event) {
      event.preventDefault();
      $('.popup-login-form').remove();
      $('.popup-registration-form').remove();
    });

    $('.register-list-item').on('click', function(event) {
      event.preventDefault();
      $.ajax({
        type: 'GET',
        url: '/register-ajax'
      }).done(function(response) {
        $('body').append(response);
      });
    })



});
