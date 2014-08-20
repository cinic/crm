class RemovePhotoFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :photo, :string
  end
end
