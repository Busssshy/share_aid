class AddStockIdAndAmountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :stock_id, :integer
    add_column :reservations, :amount, :integer
  end
end
