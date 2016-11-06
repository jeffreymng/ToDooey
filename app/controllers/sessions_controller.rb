class SessionsController < ApplicationController
  def new
    redirect_to root_url if logged_in?
  end

  def create
    if !logged_in?
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to root_url
      else
        flash.now[:danger] = "Your username or password does not match."
        @errors = ["Your username or password does not match."]
        render 'new'
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:user_id) if logged_in?
    @current_user = nil
    redirect_to root_url
  end
end
