class UsersController < ApplicationController
  def new;end

  def create
    new_user = user_params 
    # UserFacade.create_user(user_params)
  end


private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end