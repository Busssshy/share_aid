class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table   :stocks do |t|
      t.references :local_government, null: false, foreign_key: true
      t.references :genre,            null: false, foreign_key: true
      t.string     :name
      t.date       :deadline
      t.integer    :amount
      t.text       :memo
      t.timestamps  null: false
    end
  end
end
