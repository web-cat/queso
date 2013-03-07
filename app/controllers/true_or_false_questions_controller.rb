class TrueOrFalseQuestionsController < QuestionsController
  load_and_authorize_resource
  
  def update
    
    if @true_or_false_question.update_attributes(params[:true_or_false_question])
      redirect_to @true_or_false_question, notice: 'Question was successfully updated.'
    else
      render action: "edit"
    end
    
  end
  
end
