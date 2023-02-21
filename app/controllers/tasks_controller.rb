class TasksController < ApplicationController
  def index
    @tasks = Task.where({ "user_id" => session["user_id"] })
    @task = Task.new
  end

  def create
    if @current_user
      @task = Task.new
      @task["description"] = params["task"]["description"]
      @task["user_id"] = @current_user["id"]
      @task.save
    end
    
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    if @task["user_id"] == @current_user["id"]
      @task.destroy
    end

    redirect_to "/tasks"
  end
end
