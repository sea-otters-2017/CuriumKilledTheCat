$(document).ready(function() {

/// new answer listener
    $("#event-listener").on('submit', '#new-answer-button', function(event) {
      event.preventDefault();
      resetPage();
      $this = $(this)
      $.ajax({
        type: 'GET',
        url: $this.prop('action')
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
      var $this = $(this)
      $.ajax({
        type: 'POST',
        url: $this.prop('action'),
        data: $this.serialize()
      }).done(function(data){
        $('#answers-list').append(data);
        resetPage();
      }).error(function(data){
        alert('answer field cannot be left blank')
      })
    });

///new comment listener
    $("#event-listener").on('click', '#new-comment-button', function(event) {
      event.preventDefault();
      resetPage();
      var $this = $(this)
      var answerId = $this.closest('div').prop('id')
      $.ajax({
        type: 'GET',
        url: $this.closest('form').prop('action')
      }).done(function(data){
        $this.parent().addClass('hidden');
        $("#" + answerId).append(data);
        $('#new-comment-form').children('textarea').focus();
      }).error(function(response) {
        alert('You must be logged in to leave a comment')
      })
    });

    $("#event-listener").on('submit', '#new-comment-form', function(event) {
      event.preventDefault();
      var $this = $(this)
      var tableId = $this.closest('td').children('table').prop('id')
      $.ajax({
        type: 'POST',
        url: $this.prop('action'),
        data: $this.serialize()
      }).done(function(data){
        $('#' + tableId).append(data);
        resetPage();
      }).error(function(data){
        alert('comment can\'t be left blank')
      })
    });

    $('#event-listener').on('click', '.cancel', function(event){
      event.preventDefault();
      resetPage();
    })
});

function resetPage() {
  $('.comment-form').remove();
  $('#new-answer-form').remove();
  $('.new-comment-form-button').removeClass('hidden');
  $('#new-answer-button').removeClass('hidden');
}
