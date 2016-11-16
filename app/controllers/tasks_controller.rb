class TasksController < ApplicationController
  before_action :current_user

  def show
    #do i need a show task page?
  end

  def new
    if logged_in?
      @task = Task.new
    else
      redirect_to login_url
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end
