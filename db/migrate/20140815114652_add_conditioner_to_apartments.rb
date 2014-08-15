class AddConditionerToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :conditioner, :boolean
  end
end
