class TasksController < ApplicationController
  respond_to :html, :js
  
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
    end
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
