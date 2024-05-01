class Volunteer::ReservationsController < ApplicationController
  before_action :authenticate_volunteer!

  def comfirm
    @reservation_items = ReservationConfirmation.where(volunteer_id: current_volunteer.id)
  end

  def create
    # reservation = Reservation.new
    reservation_item = current_volunteer.reservations.build(reservation_params)
    reservation_item.volunteer_id = current_volunteer.id
    reservation_items = Reservation.where(volunteer_id: current_volunteer.id)
    if reservation_item.save
      reservation_items.each do |item|
        ReservationDetail.create!(reservation_id: reservation_item.id, stock_id: reservation_item.stock.id, amount: reservation_item.amount)
      end
      reservation_items.destroy_all
      redirect_to volunteer_reservations_thanks_path
    else
      render :comfirm
    end
  end

  def thanks
    # @reservation = Reservation.find(params[:id])
    # @reservation_details = @reservation.reservation_details
  end

  def index
    @reservations = current_volunteer.reservations.all
  end

  private

  def reservation_params
    params.require(:reservation).permit(:volunteer_id, :stock_id, :amount)
  end

end
