class AddWhenSeeToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :when_see, :string
  end
end
