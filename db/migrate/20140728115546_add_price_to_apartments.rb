class AddPriceToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :price, :integer
  end
end
