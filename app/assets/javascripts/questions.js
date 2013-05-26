
$(document).on("click", "#questionDeleteButton", function () {
	var deleteQuestionId = $(this).data('delete-question-id');
	$(".modal-footer form").attr("action", "/questions/" + deleteQuestionId);
	$('#deleteQuestionModal').modal('show');
});

$(document).ready(function() { 
	$('#question_type').change( function() {
	   var extras = [$("div#true-or-false-question-extra"), $("div#multiple-choice-question-extra")];
	   
	   $.each(extras, function () {
   	   	  $(this).hide();
	   });
	   
	   var thisExtra = $(this).find("option:selected").attr('value').replace(/_/g, "-");
	   
	   $("div#" + thisExtra + "-extra").fadeIn();	   
	});
	
	$("#addOptions").click( function () {
		$("ul#mc-options").append(
				'<div class="row">' +
					'<li style="line-height: 30px; margin-left: 10px;">' +
						'<div class="span4" style="margin-left: 0px;">' +
							'<input class="span4" id="question_options__statement" name="question[options][][statement]" type="text" value="" />' +
						'</div>' +
						'<div class="span1">' +
							'<input class="span1" id="question_options__points" name="question[options][][points]" type="text" value="" />' +
						'</div>' +
					'</li>' +
				'</div>' +
				'<br />'
		);
		
		return false;
	});
	
});