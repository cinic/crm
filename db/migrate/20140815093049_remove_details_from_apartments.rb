class RemoveDetailsFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :balcony_glazed, :boolean
    remove_column :apartments, :balcony_size, :float
    remove_column :apartments, :furnished, :boolean
    remove_column :apartments, :near, :string
    remove_column :apartments, :when_see, :string
    remove_column :apartments, :when_placed, :string
  end
end
