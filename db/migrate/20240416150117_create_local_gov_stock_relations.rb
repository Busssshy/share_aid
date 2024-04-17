class CreateLocalGovStockRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :local_gov_stock_relations do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :local_government, null: false, foreign_key: true

      t.timestamps
    end
  end
end
