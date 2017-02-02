class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @suggestion = Restaurant.find_by(suggested: Date.today)
      if @suggestion.nil?
        @suggestion = Restaurant.where.not(suggested: Date.yesterday).sort_by(&:suggestion_score).reverse[0]
        @suggestion.update(suggested: Date.today)
      end
    render "/index"
  end

   def logged_in?
    return true if session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
end
