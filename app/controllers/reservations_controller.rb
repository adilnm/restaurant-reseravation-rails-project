class ReservationsController < ApplicationController

  before_action :require_login

  def index
      @user=current_user
      @reservations=@user.reservations
  end

  def show
    @reservation=Reservation.find(params[:id])
  end

  def new
    @reservation=Reservation.new(user_id:current_user.id)
  end

  def create
    @reservation=Reservation.new(reservation_params)
    if @reservation.valid? && @reservation.save
      redirect_to user_reservation_path(current_user,@reservation)
    elsif @reservation.restaurant_id
      # if we are making a reservation through api data
      @restaurant=Restaurant.find(params[:reservation][:restaurant_id])
      @reviews=@restaurant.reviews
      @errors=@reservation.errors.messages.map{|k,v|"#{k} #{v.first}"}
      render 'restaurants/show'

    else
      @errors=@reservation.errors.messages.map{|k,v|"#{k} #{v.first}"}
      render 'new'
    end
  end

  def edit
    @reservation=Reservation.find(params[:id])
  end

  def update
    @reservation=Reservation.find(params[:id])
    @reservation.update(date: params[:reservation][:date], time: params[:reservation][:time], number_of_people: params[:reservation][:number_of_people])
    redirect_to reservation_path(@reservation)
  end

  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to reservations_url
  end


  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :number_of_people, :user_id, :restaurant_id, restaurant_attributes:[:name, :address, :cuisine, :phone_number])
  end

end
