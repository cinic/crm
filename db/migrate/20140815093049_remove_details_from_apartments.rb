class RemoveDetailsFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :balcony_glazed
    remove_column :apartments, :balcony_size
    remove_column :apartments, :furnished
    remove_column :apartments, :near
    remove_column :apartments, :when_see
    remove_column :apartments, :when_placed
  end
end
