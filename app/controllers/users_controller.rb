class UsersController < ApplicationController
  before_action :current_user

  def show
    if logged_in?
      @tasks = @current_user.tasks
    end
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account created."
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "Could not create an account."
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name)
    end

end
