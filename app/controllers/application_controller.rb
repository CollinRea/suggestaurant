class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render "/index"
  end

   def logged_in?
    return true if session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
end
