class AddMetroTimeToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :time_to_metro, :string
  end
end
