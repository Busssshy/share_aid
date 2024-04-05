class CreateLocalStockRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :local_stock_relationships do |t|

      t.timestamps
    end
  end
end
