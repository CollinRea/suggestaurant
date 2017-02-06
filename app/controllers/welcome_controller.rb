class WelcomeController < ApplicationController

  def index
    @suggestion = Restaurant.find_by(suggested: Date.today)

      if @suggestion.nil?
        @suggestion = Restaurant.where.not(suggested: Date.yesterday).sort_by(&:suggestion_score).reverse[0]
        if @suggestion
          @suggestion.update(suggested: Date.today)
        end
      end
    render "/index"
  end
end