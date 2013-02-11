class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new    
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    puts("DEBUG -------------> " + @user_session.to_json)
    respond_to do |format|
      format.html
      format.json {
        if @user_session.save
          render text: "login_successful", :status => 401
          #redirect_to(:root, :notice => 'Login Successful')
        else
          errors_array = []
          @user_session.errors.full_messages.each do |msg|
            errors_array.push(msg)
          end
          
          render json: errors_array.to_json
        end
      }
    end
    
    #if @user_session.save
    #  redirect_to(:root, :notice => 'Login Successful')
    #else
    #  render :action => "new"
    #end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    
    redirect_to(:root, :notice => 'Goodbye!')
  end
end
