class AddDetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :alternate_phone, :string
    add_column :clients, :email, :string
    add_column :clients, :object_relation, :string
  end
end
