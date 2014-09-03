class AddCommissionsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :commission_agent, :string
    add_column :apartments, :commission_client, :string
  end
end
