class CreateMoneyStatuses < ActiveRecord::Migration
  def change
    create_table :money_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
