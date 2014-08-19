class RemoveMetroInfoFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :walk_to_metro, :string
    remove_column :apartments, :drive_to_metro, :string
    remove_column :apartments, :urban_transport_to_metro, :string
    remove_column :apartments, :taxi_bus_to_metro, :string
    remove_column :apartments, :suburban_transport_to_metro, :string
  end
end
