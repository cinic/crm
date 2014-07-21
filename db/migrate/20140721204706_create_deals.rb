class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :employer, index: true
      t.references :renter, index: true
      t.references :agent, index: true
      t.references :apartment, index: true
      t.references :user, index: true
      t.integer :price
      t.integer :deposit
      t.boolean :communal
      t.integer :lease_term
      t.integer :commission
      t.datetime :date

      t.timestamps
    end
  end
end
