class UsersController < ApplicationController
  def new;end

  def create
    user = UserFacade.create_user(user_params)
    if user.is_a?(Error)
      flash[:alert] = user.message
      redirect_to '/register'
    elsif user.is_a?(User)
      redirect_to '/dashboard'
    end
  end

  def show
    # @user = UserFacade.get_user(session[:id])
    # @items = ItemFacade.get_user_items(user[:id])
  end

private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end