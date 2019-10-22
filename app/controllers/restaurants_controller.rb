require 'romato'

class ResstaurantsController < ApplicationController
  def location

  end

  def city
    zomato_instance = Romato::Zomato.new("c4a2f8a916b0059bb5fa24b1ac0aba1a")
    z=zomato_instance.get_cities( {q: "seattle", count: 30} )
    binding.pry
  end


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
