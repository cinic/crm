class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :mobile
      t.string :passport

      t.timestamps
    end
    add_index :landlords, :name
  end
end
