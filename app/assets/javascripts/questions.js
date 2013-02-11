
$(document).on("click", "#questionDeleteButton", function () {
  var deleteQuestionId = $(this).data('delete-question-id');
  $(".modal-footer form").attr("action", "/questions/" + deleteQuestionId);
  $('#deleteQuestionModal').modal('show');
});