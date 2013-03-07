class ExamsController < ApplicationController
  load_and_authorize_resource
  
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.order('id DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  def new
            
  end

  # GET /exams/1/edit
  def edit
    
    # This is for the list of existing questions that can be added to the exam.
    @questions = Question.order('id DESC').page(params[:page]).per(10)
    
  end

  # POST /exams
  def create
    
    @exam.user_id = current_user.id

    if @exam.save
      redirect_to edit_exam_path(@exam), notice: 'Exam was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /exams/1
  def update
    
    if @exam.update_attributes(params[:exam])
      redirect_to @exam, notice: 'Exam was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /exams/1
  def destroy
    
    @exam.destroy

    redirect_to exams_url
  end
  
  def add_new_question_to_exam
    
    @exam = Exam.find(params[:id])
    
    authorize! :update, @exam
    
    @exam.update_attributes(params[:exam]) # Save frequently, save aggressively!
    
    # Create and add the new question.
    if params[:question]
      
      questionModel = params[:question].delete(:type).camelize.constantize
      
      question = questionModel.create(params[:question].merge({:user_id => current_user.id}))
      
      question_on_exam = QuestionOnExam.create({:question_id => question.id, :exam_id => @exam.id, :position => @exam.questions.count + 1 })
    end
    
    if @exam.save
      render :partial => "form"
    else
      render :partial => "form", :notice => "There was an error updating this exam."
    end
    
  end
  
  def add_existing_question_to_exam
    
    @exam = Exam.find(params[:id])
    
    authorize! :update, @exam
    
    @exam.update_attributes(params[:exam]) # Save frequently, save aggressively!
    
    question_ids = @exam.question_on_exams.pluck(:question_id)
    
    # Add the selected questions to the exam (if not already there).
    if params[:selected_questions]
      
      params[:selected_questions].each do |q_id|
        
        if !question_ids.include?(q_id.to_i)
          QuestionOnExam.create({:question_id => q_id.to_i, :exam_id => @exam.id, :position => @exam.questions.count + 1 })
        end
        
      end
         
    end    
    
    if @exam.save
      render :partial => "form"
    else
      render :partial => "form", :notice => "There was an error updating this exam."
    end
    
  end
  
end
