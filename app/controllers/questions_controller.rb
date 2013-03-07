class QuestionsController < ApplicationController
  load_and_authorize_resource :except => :create
  
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order('id DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
      format.csv { send_data @questions.to_csv }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  def new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create    
    params[:question].each_value(&:strip!)
        
    questionModel = params[:question].delete(:type).camelize.constantize
    
    @question = questionModel.new( params[:question] )
    
    authorize! :create, @question
    
    @question.user_id = current_user.id
    
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /questions/1
  def update
    
    if @question.update_attributes(params[:question])
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    
    redirect_to questions_path
  end
end
