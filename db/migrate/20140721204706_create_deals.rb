class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :landlord, null: false, index: true
      t.references :tenant, null: false, index: true
      t.references :agent, index: true
      t.references :apartment, null: false, index: true
      t.references :user, null: false, index: true
      t.integer :price, null: false
      t.integer :deposit
      t.boolean :communal
      t.integer :lease_term
      t.integer :commission
      t.datetime :date

      t.timestamps
    end
  end
end
