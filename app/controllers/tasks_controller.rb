class TasksController < ApplicationController
  respond_to :html, :js
  
  def create
    @list = current_user.list
    @task = Task.new(task_params)
    @task.list = @list

    if @task.save
      redirect_to @list
    else
      flash[:error] = "There was an error saving the Task. Please try again."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    task_description = @task.description
    @list = @task.list
    
    if @task.destroy
      flash[:notice] = "'#{task_description}' complete!"
    else
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
