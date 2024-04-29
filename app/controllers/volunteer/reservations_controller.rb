class Volunteer::ReservationsController < ApplicationController
  before_action :authenticate_volunteer!

  def comfirm
    @reservation_items = ReservationConfirmation.where(volunteer_id: current_volunteer.id)
  end

  def create
    reservation = Reservation.new
    reservation.volunteer_id = current_volunteer.id
    reservation_items = ReservationConfirmation.where(volunteer_id: current_volunteer.id)

    if reservation.save
      reservation_items.each do |item|
        ReservationDetail.create!(reservation_id: reservation.id, stock_id: reservation_confirmation.stock.id, amount: reservation_confirmation.amount)
      end
      reservation_items.destroy_all
      redirect_to volunteer_reservations_thanks_path
    else
      render :comfirm
    end
  end

  def thanks
    @reservation = Reservation.find(params[:id])
    @reservation_details = @reservation.reservation_details
  end

  def index
    @reservations = current_volunteer.reservations.all
  end

end
