class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user 
    UserFacade.get_user(session[:id]) if session[:user_id]
  end

end
