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
    @reservation=Reservation.new(user_id:params[:user_id])
  end

  def create
    @reservation=Reservation.new(reservation_params)
    if @reservation.save
      redirect_to user_reservation_path(current_user,@reservation)
    else
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


  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :number_of_people, :user_id, :restaurant_id)
  end

end
