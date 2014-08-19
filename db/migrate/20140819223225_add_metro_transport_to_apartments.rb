class AddMetroTransportToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :transport_to_metro, :string
  end
end
