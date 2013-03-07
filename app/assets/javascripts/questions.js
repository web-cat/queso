
$(document).on("click", "#questionDeleteButton", function () {
  var deleteQuestionId = $(this).data('delete-question-id');
  $(".modal-footer form").attr("action", "/questions/" + deleteQuestionId);
  $('#deleteQuestionModal').modal('show');
});

$(document).ready(function() { 
	$('#question_type').change(function()
	{
	   if ($(this).find("option:selected").attr('value') == "true_or_false_question")
	   {
	   		$("div#true-or-false-extra").fadeIn();
	   }
	   else
	   {
	   		$("div#true-or-false-extra").hide();
	   }
	   
	});
});