class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :setTitle

  helper_method :logged_in?
  helper_method :current_user

  
  def setTitle
    @title = 'Cookbook'
  end
  
  protect_from_forgery with: :exception

  def logged_in?
    session[:logged_in]
  end

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      session[:logged_in] = (user_name == 'admin' && password == 'password')
    end
  end

  def authenticate
    if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
      session[:user_id] = user.id
      session[:logged_in] = true
    else
      request_http_basic_authentication
    end
  end
  
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
