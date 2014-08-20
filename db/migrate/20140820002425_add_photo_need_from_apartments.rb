class AddPhotoNeedFromApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :photo_need, :string
  end
end
