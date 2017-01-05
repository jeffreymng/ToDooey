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
    @task = Task.new(task_params)
    @task.user_id = @current_user.id
    if @task.save
      flash[:success] = "Task added"
      redirect_to tasks_url
    else
      @errors = @task.errors.full_messages
      flash.now[:danger] = "Could not add task"
      render 'new'
    end
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
