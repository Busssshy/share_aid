class Volunteer::ReservationsController < ApplicationController
  before_action :authenticate_volunteer!

  # def comfirm
  #   @reservation_items = ReservationConfirmation.where(volunteer_id: current_volunteer.id)
  # end

  def create
    @reservation_item = current_volunteer.reservations.build(reservation_params)
    @reservation_item.volunteer_id = current_volunteer.id
    if @reservation_item.save
      ReservationDetail.create!(
        reservation_id: @reservation_item.id,
        stock_id: @reservation_item.stock_id,
        amount: @reservation_item.amount
      )
      redirect_to thanks_volunteer_reservations_path(reservation_id: @reservation_item.id)
    else
      render :comfirm
    end
  end

  def thanks
    reservation_id = params[:reservation_id]
    @reservation = Reservation.find(reservation_id)
    @reservation_details = @reservation.reservation_details
  end

  def index
    @reservations = current_volunteer.reservations.all
  end

  private

  def reservation_params
    params.require(:reservation).permit(:volunteer_id, :stock_id, :amount)
  end

end
