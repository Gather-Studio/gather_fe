class UsersController < ApplicationController
  def new;end

  def create
    user = UserFacade.create_user(user_params)
    ##create an error poros in facade? if instance of user, set session and redirect to dashboard_path 
    ##if instance of error, return error and redirect back to form with error message. 
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