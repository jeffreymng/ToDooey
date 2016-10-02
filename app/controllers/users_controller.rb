class UsersController < ApplicationController
  def new
    @user = User.new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Account created."
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "Could not create an account."
      render 'new'
    end
  end
end
