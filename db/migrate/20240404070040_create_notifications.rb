class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :local_government, foreign_key: true, null: false
      t.references :notifiable,       polymorphic: true, null: false
      t.boolean    :read,             default: false,    null: false
      t.timestamps  null: false
    end
  end
end
