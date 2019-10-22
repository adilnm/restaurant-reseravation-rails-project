
class RestaurantsController < ApplicationController
  def location

  end

  def city
    @api_key="c4a2f8a916b0059bb5fa24b1ac0aba1a"
    zomato_cities_url="https://developers.zomato.com/api/v2.1/cities?q=#{params[:city]}"
    response = HTTParty.get(zomato_cities_url, headers: {"Accept" => "application/JSON", "user-key" => @api_key})
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
