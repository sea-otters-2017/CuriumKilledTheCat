$(document).ready(function() {

/// new answer listener
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();

      var questionId = ($(this).children().prop('id'))
      $this = $(this)
      resetPage();

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
        resetPage();

      }).error(function(data){
        alert('answer field cannot be left blank')
      })
    });

    $('#event-listener').on('click', '.cancel', function(event){
      event.preventDefault();
      resetPage();
    })

///new comment listener
    $("#event-listener").on('click', '#new-comment-button', function(event) {
      event.preventDefault();
      resetPage();
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
        resetPage();
      }).error(function(data){
        alert('comment can\'t be left blank')
      })
    });
});

function resetPage() {
  $('.comment-form').remove();
  $('#new-answer-form').remove();
  $('.new-comment-form-button').removeClass('hidden');
  $('#new-answer-button').removeClass('hidden');
}
