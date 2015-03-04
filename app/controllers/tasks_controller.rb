class TasksController < ApplicationController
  respond_to :html, :js, :json
  
  def create
    @list = current_user.list
    @task = Task.new(task_params)
    @task.list = @list
    @new_task = Task.new

    if !@task.save
      flash[:error] = "There was an error saving the task. Please try again."
    end
    
    respond_with(@task) do |format|
      format.html { redirect_to @list }
    end
  end

  def destroy
    @task = Task.find(params[:id])
    task_description = @task.description
    @list = @task.list
    
    if !@task.destroy
      flash[:error] = "There was an error. Try again."
    end
    
    respond_with(@task) do |format|
      format.html { redirect_to @list }
      format.js
    end
  end
  
  def update
    @task = set_task
    if @task.update(task_params)
      respond_with(@task.list)
    else
      format.json { respond_with_bip(@user) }
      flash[:error] = "Task was not successfully updated. Try Again."
    end
  end
  
  private
  
  def set_task
    Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
