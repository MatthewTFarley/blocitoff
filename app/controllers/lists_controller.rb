class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:edit, :update, :destroy]
  
  respond_to :html, :json

  def show
    @list = current_user.list
    @tasks = nil
    
    if @list != nil && params[:id] == @list.id.to_s
      @tasks = @list.tasks
      respond_with(@list)
    else
      redirect_to @list || new_list_path
    end
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
    if @list != nil && @list == current_user.list
       respond_with(@list)
    else
      redirect_to @list || new_list_path
    end
  end

  def create
    @user = current_user
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      flash[:message] = "New list created!"
      respond_with(@list)
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to new_list_path
    end
  end

  def update
    if @list.update(list_params)
      respond_with(@list)
    else
      format.json { respond_with_bip(@user) }
      flash[:error] = "List was not successfully updated. Try Again."
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = "List successfully deleted."
      redirect_to new_list_path
    else
      flash[:error] = "The list was not successfully deleted. Try again."
      respond_with(@list)
    end
  end

  private
  
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :user_id)
    end
end
