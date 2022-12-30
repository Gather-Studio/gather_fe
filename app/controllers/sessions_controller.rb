class SessionsController < ApplicationController
  
  def new
  end

  def create
    ##login 
  end
  
  def destroy
    session.destroy
    redirect_to '/'
  end
end