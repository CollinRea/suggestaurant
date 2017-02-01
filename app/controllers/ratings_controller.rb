class RatingsController < ApplicationController

  def new
    @rating = Rating.new

    if request.xhr? 
      render :new, layout: false, locals: {rating: @rating}
    end

  end

  def create
    @rating = Rating.new(rating_params)
    if request.xhr?
      name = params["restaurant_name"]
      restaurant = Restaurant.find_by(name: name)
      p 'Score'
      p @rating
      p 'Restaurant'
      p restaurant
      p current_user.id
      @rating.restaurant_id = restaurant.id
      @rating.user_id =current_user.id
      p @rating
      if @rating.save
        redirect_to restaurants_path
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :user_id, :restaurant_id)
  end
end