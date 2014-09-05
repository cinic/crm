class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string :name
      t.decimal :lng, precision: 11, scale: 6
      t.decimal :lat, precision: 8, scale: 6
      t.string :color
      t.string :line
      t.string :city

      t.timestamps
    end
    add_index :metros, :city
  end
end
