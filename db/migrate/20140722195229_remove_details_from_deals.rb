class RemoveDetailsFromDeals < ActiveRecord::Migration
  def change
    remove_reference :deals, :employer, index: true
    remove_reference :deals, :renter, index: true
  end
end
