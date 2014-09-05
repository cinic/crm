class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string :name
      t.string :city
      t.integer :id_on_cian
      t.integer :id_on_avito

      t.timestamps
    end
    add_index :metros, :city
  end
end
