class WelcomeController < ApplicationController
  
  def index
    redirect_to current_user.list if user_signed_in?
  end
end
