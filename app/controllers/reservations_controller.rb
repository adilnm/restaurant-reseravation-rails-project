class ReservationsController < ApplicationController

  def index
    if params[:user_id]
      @user=current_user
      @reservations=@user.reservations
    end
  end
  def new
    @reservation=Reservation.new
  end
end
