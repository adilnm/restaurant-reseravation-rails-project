class RestaurantsController < ApplicationController
  def new
    @restaurant=Restaurant.new
  end

  def create
    @restaurant=Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_path

    end
  end

  def show
    @restaurant=Restaurant.find(params[:id])
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address)
  end
end
