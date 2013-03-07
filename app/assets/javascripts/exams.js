
$(document).on("click", "#examDeleteButton", function () {
	var deleteExamId = $(this).data('delete-exam-id');
	var deleteExamName = $(this).data('delete-exam-name');
	$(".modal-body #exam-to-delete").text(deleteExamName);
	$(".modal-footer form").attr("action", "/exams/" + deleteExamId);
	$('#deleteExamModal').modal('show');
});

$(document).ready( function(){
	$.fn.onReady();
});

$.fn.onReady = function() {
	$(".form-datetime").datetimepicker({
    	format: "dd M yyyy - hh:ii"
    });
    
    $('.accordion').on('show hide', function(e){
	    $(e.target).siblings('.accordion-heading').find('.accordion-toggle i').toggleClass('icon-chevron-down icon-chevron-right', 200);
	});
}




// For creating a new question.

$(document).on("click", "div#exam-create-question", function () {
	if ($("form#new_question").is(":visible"))
	{
		$("form#new_question").fadeOut();
	}
	else
	{		
		$("form#new_question").fadeIn();
		$("input#add-new-question-to-exam").removeAttr("disabled");
	}	
});

$(document).on("click", "div#cancel-new-question", function () {
	$("form#new_question").fadeOut();
	$("form#new_question")[0].reset();
	$("div#exam-create-question").button('toggle');
});

$(document).on("click", "input#add-new-question-to-exam", function () {
	$(this).attr("disabled", "disabled");
	
	var id = $('input#exam_id').val();
	
	var formData = $('form#edit_exam_' + id).serialize();
	
	var newQuestionFormData = $('form#new_question').serialize();
	
	formData = formData + '&' + newQuestionFormData;
	
	$.ajax({
		type: 'put',
	    url: "/exams/" + id + "/add_new_question_to_exam",
	    cache: false,
	    dataType: 'html',
	    data: formData,
	    success: function(html){
	      $("div#new-exam-form").html(html);
	      $("form#new_question").fadeOut();
	      $("form#new_question")[0].reset();
	      $("div#exam-create-question").removeAttr("disabled");
	      $.fn.onReady();
	    }
	});
	
	return false; // prevents normal behaviour
});


// For including existing questions.

$(document).on("click", "div#exam-include-question", function () {
	if ($("div#question-chooser").is(":visible"))
	{
		$("div#question-chooser").fadeOut();
	}
	else
	{
		$("div#question-chooser").fadeIn();
		$("div#add-existing-question-to-exam").removeAttr("disabled");
	}
});

$(document).on("click", "div#cancel-existing-question", function () {
	$("div#question-chooser").fadeOut();
	$("div#exam-include-question").button('toggle');
});

$(document).on("click", "input#add-existing-question-to-exam", function () {
	$(this).attr("disabled", "disabled");
	
	var id = $('input#exam_id').val();
	
	var formData = $('form#edit_exam_' + id).serialize();
	
	var questionsIdsData = $('form#add_existing_question_form').serialize();
	
	formData = formData + '&' + questionsIdsData;
	
	$.ajax({
		type: 'put',
	    url: "/exams/" + id + "/add_existing_question_to_exam",
	    cache: false,
	    dataType: 'html',
	    data: formData,
	    success: function(html){
	      $("div#new-exam-form").html(html);
	      $("div#question-chooser").fadeOut();
	      $('form#add_existing_question_form')[0].reset();
	      $("input#add-existing-question-to-exam").removeAttr("disabled");
	      $.fn.onReady();
	    }
	});
	
	return false; // prevents normal behaviour
});
