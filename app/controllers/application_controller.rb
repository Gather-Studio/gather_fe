class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user 
    UserFacade.get_user(session[:id]) if session[:id]
  end

    def authorize_user
      unless session[:id]
        flash[:unauthorized] = 'Oopsy daisy! Please log in below to view that page.'
        redirect_to '/'
      end
  end

end
