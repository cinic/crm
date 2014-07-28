class AddDetailsToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :from_lead, :boolean
  end
end
