class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table   :stocks do |t|
      t.references :local_government, null: false, foreign_key: true
      t.string     :name
      t.date       :deadline
      t.integer    :one_daily_quantity
      t.integer    :amount
      t.text       :memo
      t.timestamps  null: false
    end
  end
end