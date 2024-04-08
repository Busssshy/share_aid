class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.timestamps  null: false
    end
  end
end
