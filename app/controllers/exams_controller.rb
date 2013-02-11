class ExamsController < ApplicationController
  load_and_authorize_resource
  
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all

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
    
  end

  # POST /exams
  def create

    if @exam.save
      redirect_to @exam, notice: 'Exam was successfully created.'
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
  
end
