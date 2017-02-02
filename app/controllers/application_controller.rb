class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @suggestion = Restaurant.all.sort_by(&:suggestion_score).reverse[0]
    render "/index"
  end

   def logged_in?
    return true if session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
end
