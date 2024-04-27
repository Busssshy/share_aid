class AddAmountToReservationConfirmations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservation_confirmations, :amount, :integer
  end
end
