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
      restaurant = Restaurant.find_by(name: params["restaurant_name"])
      @rating.restaurant_id = restaurant.id
      @rating.user_id =current_user.id
      if @rating.save
        redirect_to restaurants_path
      end
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    if request.xhr? 
      render :edit, layout: false, locals: {rating: @rating}
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update_columns({score: rating_params[:score]})
      redirect_to restaurants_path
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :user_id, :restaurant_id)
  end
end