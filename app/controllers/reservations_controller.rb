class ReservationsController < ApplicationController

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

  end
end
