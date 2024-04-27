class Volunteer::ReservationConfirmationsController < ApplicationController
  before_action :authenticate_volunteer!

  def create
    increace_or_create(reservation_confirmation_params)
    redirect_to volunteer_reservations_path
  end

  private

  def reservation_confirmation_params
    params.require(:reservaion_confirmation).permit(:volunteer_id, :stock_id, :amount)
  end

end
