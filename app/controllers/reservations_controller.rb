class ReservationsController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @reservation = current_user.reservations.create(reservation_params)

    redirect_to @reservation.event, notice: "Event reserved!"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :price, :guests_count)
  end
end
