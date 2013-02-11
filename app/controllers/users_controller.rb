class UsersController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]

  def index
    @users = User.order('id DESC').page(params[:page])
    
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end
  
  def show
    
  end

  def new
    
  end

  def edit
    
  end

  def create
    params[:user].each_value(&:strip!)
    @user = User.new
    
    authorize! :create, @user
    
    @user.make_admin_if_first
    
    @user.firstname = params[:user][:firstname]
    @user.lastname = params[:user][:lastname]
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.role = params[:user][:role] # TODO: This shouldn't really be here. Just for testing.
    
    if @user.save
      redirect_to :root
    else
      render "new"
    end
  end

  def update
    params[:user].each_value(&:strip!)
    @user = User.find(params[:id])    
    
    authorize! :update, @user
  
    @user.firstname = params[:user][:firstname]
    @user.lastname = params[:user][:lastname]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.role = params[:user][:role] # TODO: This shouldn't really be here. Just for testing.
  
    if @user.save
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url
  end  
  
end
