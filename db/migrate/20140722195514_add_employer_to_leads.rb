class AddEmployerToLeads < ActiveRecord::Migration
  def change
    add_reference :leads, :landlord, index: true
  end
end
