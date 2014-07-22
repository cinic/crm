class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :mobile
      t.references :apartment, index: true
      t.references :employer, index: true

      t.timestamps
    end
    add_index :leads, :name
  end
end
