class TasksController < ApplicationController
  def show
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
end
