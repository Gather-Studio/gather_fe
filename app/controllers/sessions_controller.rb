class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = SessionFacade.create_session(login_params)
    if user.is_a?(Error)
      flash[:alert] = user.message
      redirect_to '/login'
    elsif user.is_a?(User)
      session[:id] = user.id
      redirect_to '/dashboard'
    end
  end
  
  def destroy
    session.destroy
    redirect_to '/'
  end


private
  def login_params
    params.permit(:email, :password)
  end
end