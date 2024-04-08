class CreateReservationConfirmations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_confirmations do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.references :stock,     null: false, foreign_key: true
      t.timestamps  null: false
    end
  end
end
