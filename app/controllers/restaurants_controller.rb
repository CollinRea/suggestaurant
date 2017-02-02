class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.sort_by(&:average).reverse
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      @errors = restaurant.errors.full_messages
      render :new
    end
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update(restaurant_params)
    if !request.xhr?
      redirect_to root_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :last_visited)
  end

end