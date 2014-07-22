class AddDetailsToDeals < ActiveRecord::Migration
  def change
    add_reference :deals, :landlord, index: true
    add_reference :deals, :tenant, index: true
  end
end
