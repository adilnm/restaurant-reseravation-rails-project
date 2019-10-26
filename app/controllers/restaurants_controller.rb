
class RestaurantsController < ApplicationController
  def location
  end

  def city
    @api_key="c4a2f8a916b0059bb5fa24b1ac0aba1a"
    if !params[:city].empty?
      zomato_cities_url="https://developers.zomato.com/api/v2.1/cities?q=#{params[:city]}"
      @response = HTTParty.get(zomato_cities_url, headers: {"Accept" => "application/JSON", "user-key" => @api_key})
      render 'location'

    elsif params[:city_id] && !params[:city_id].empty?
      cuisine_url="https://developers.zomato.com/api/v2.1/cuisines?city_id=#{params[:city_id]}"
      @cuisine=HTTParty.get(cuisine_url, headers: {"Accept" => "application/JSON", "user-key" => @api_key})
      @city_id=params[:city_id]
      render 'location'

    elsif params[:cuisine_id] && !params[:cuisine_id].empty?

      @city_id=params[:citi_id]
      @cuisine_id=params[:cuisine_id]
      zomato_restau_url="https://developers.zomato.com/api/v2.1/search?entity_id=#{@city_id}&entity_type=city&cuisines=#{@cuisine_id}"
      @restau=HTTParty.get(zomato_restau_url, headers: {"Accept" => "application/JSON", "user-key" => @api_key})
      render 'location'
    elsif params[:restau_id] && !params[:restau_id].empty?

      restau_url="https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:cityid]}&entity_type=city&cuisines=#{params[:cuisineid]}"
      @r=HTTParty.get(restau_url, headers: {"Accept" => "application/JSON", "user-key" => @api_key})
      @result=@r['restaurants'].find{|p| p['restaurant']['id']==params[:restau_id]}
      @name=@result['restaurant']['name']
      @address=@result['restaurant']['location']['address']
      @cuisine=@result['restaurant']['cuisines']
      @rating=@result['restaurant']['user_rating']['aggregate_rating']
      @phone_number=@result['restaurant']['phone_numbers']

      @restaurant=Restaurant.new(name:@name, cuisine:@cuisine, address:@address, rating:@rating, phone_number:@phone_number)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        redirect_to location_path
      end

    end
  end

  def list

    redirect_to restaurants_path
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
    @reservation=Reservation.new(user_id:current_user.id, restaurant_id:@restaurant.id)
    binding.pry
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address)
  end
end
