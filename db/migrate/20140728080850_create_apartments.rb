class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :metro
      t.string :address, null: false
      t.integer :rooms
      t.boolean :only_room
      t.boolean :adjacent_rooms
      t.float :apartment_size
      t.float :kitchen_size
      t.string :rooms_size
      t.float :balcony_size
      t.string :balcony
      t.boolean :balcony_glazed
      t.string :repairing
      t.integer :floor
      t.integer :floors
      t.boolean :furnished
      t.string :kitchen_furnished
      t.boolean :phone
      t.boolean :tv
      t.boolean :fridge
      t.boolean :washer
      t.boolean :animals
      t.boolean :kids
      t.boolean :bathroom_with_toilet
      t.integer :deposit
      t.boolean :deposit_divide
      t.string :near
      t.string :when_see
      t.string :when_placed
      t.text :comment
      t.references :landlord, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
