class CreateVolLocalGovRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :vol_local_gov_relations do |t|

      t.timestamps
    end
  end
end
