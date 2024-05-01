class Volunteer::ReservationConfirmationsController < ApplicationController
  before_action :authenticate_volunteer!

  def create
    # create(reservation_confirmation_params)
    # redirect_to volunteer_reservations_path

    @reservation_item = current_volunteer.reservation_confirmations.build(reservation_confirmation_params)
    @reservation_items = current_volunteer.reservation_confirmations.all
    @reservation_items.each do |reservation_item|
      if reservation_item.stock_id == @reservation_item.stock_id
        new_amount = reservation_item.amount + @cart_item.amount
        reservation_item.update_attribute(:amount, new_amount)
        @reservation_item.delete
      end
    end
    @reservation_item.save
    redirect_to volunteer_reservations_path
  end

  private

  def reservation_confirmation_params
    params.require(:reservaion_confirmation).permit(:volunteer_id, :stock_id, :amount)
  end

  # def create(reservation_confirmation_params)
  #   current_volunteer.reservation_items.create(stock_id: reservation_confirmation_params[:stock_id], amount: reservation_confirmation_params[:amount])
  # end

end
