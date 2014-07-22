class RemoveEmployerFromLeads < ActiveRecord::Migration
  def change
    remove_reference :leads, :employer, index: true
  end
end
