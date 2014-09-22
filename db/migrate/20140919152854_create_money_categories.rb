class CreateMoneyCategories < ActiveRecord::Migration
  def change
    create_table :money_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
