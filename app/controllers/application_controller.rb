class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user 
    UserFacade.get_user(session[:id]) if session[:user_id]
  end

    def authorize_user
      unless session[:id]
        flash[:alert] = 'Oopsy daisy! Please log in below to view that page.'
        redirect_to '/'
      end
  end

end
