class CreateMoneyOperations < ActiveRecord::Migration
  def change
    create_table :money_operations do |t|
      t.string :contractor
      t.references :category, index: true
      t.references :status, index: true
      t.references :deal, index: true
      t.references :user, index: true
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :date
      t.text :description
      t.string :type, index: true

      t.timestamps
    end
  end
end
