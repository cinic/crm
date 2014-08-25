class AddStatusToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :status, :string, default: "new"
  end
end
