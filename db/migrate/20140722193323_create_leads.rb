class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name, null: false
      t.string :mobile, null: false
      t.string :metro
      t.string :address
      t.integer :status, limit: 1
      t.references :user, index: true
      t.references :landlord, index: true

      t.timestamps
    end
    add_index :leads, :name
    add_index :leads, :mobile
  end
end
