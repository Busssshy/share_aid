class CreateVolLocalGovRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :vol_local_gov_relations do |t|
      t.references :local_government, null: false, foreign_key: true
      t.references :volunteer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
