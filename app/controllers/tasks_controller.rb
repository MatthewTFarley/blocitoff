class TasksController < ApplicationController
  respond_to :html
  
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
    if @task.destroy
      flash[:notice] = "The task successfully deleted."
      respond_with(@list)
    else
      flash[:error] = "The task was not successfully deleted. Try again."
      respond_with(@list)
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
