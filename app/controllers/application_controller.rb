class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :setTitle

  helper_method :logged_in?

  def logged_in?
    session[:logged_in]
  end
  
  def setTitle
    @title = 'Cookbook'
  end
  
  protect_from_forgery with: :exception

  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        session[:logged_in] = (user_name == 'admin' && password == 'password')
      end
    end
end
