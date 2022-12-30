class UsersController < ApplicationController
  before_action :authorize_user, only: %i[show]
  
  def new;end

  def create
    user = UserFacade.create_user(user_params)
    if user.is_a?(Error)
      flash[:alert] = user.message
      redirect_to '/register'
    elsif user.is_a?(User)
      session[:id] = user.id
      redirect_to '/dashboard'
    end
  end

  def show
    @user = current_user 
    # @items = ItemFacade.get_user_items(user[:id])
  end

private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end