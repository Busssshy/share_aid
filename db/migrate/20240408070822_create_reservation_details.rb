class CreateReservationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_details do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :stock,       null: false, foreign_key: true
      t.integer    :amount
      t.timestamps  null: false
    end
  end
end
