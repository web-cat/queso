
$(document).ready(function(){
	
	$('#loginModal').on("shown", function () {
		$("#user_session_email").focus();
	});
		
    $(document).ajaxError( function(e, xhr, options){
	    if(xhr.responseText == "login_successful")
	    {
	       $(location).attr('href','/');
	    }
  	});
})



var loginFormSubmitted = false;
$(document).on("click", "#userLoginModalButton", function () {
	if (!loginFormSubmitted)
	{
		loginFormSubmitted = true;
		$("form#new_user_session").submit(submitForm);
	}
	
});

function submitForm() 
{
    var valuesToSubmit = $(this).serialize();
    
    $.ajax({
        url: $(this).attr('action'),
        type: 'post',
        data: valuesToSubmit,
        dataType: 'json'
	}).success(function(json){
    	// This is only called when the login FAILS.
    	var errorsHTML = '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a>';
    	
    	for (i = 0; i < json.length; i++)
    	{
		    errorsHTML = errorsHTML + '<p>' +  json[i] + '</p>';
		}
    	
    	errorsHTML = errorsHTML + "</div>";
    	$("#user_session_errors").html(errorsHTML);
    });
    
    return false; // prevents normal behaviour
};
