class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.references :stock, null: false, foreign_key: true
      t.string     :name
      t.timestamps  null: false
    end
  end
end
