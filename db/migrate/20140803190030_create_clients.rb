class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :passport
      t.string :mobile, limit: 11, null: false
      t.string :type

      t.timestamps
    end
    add_index :clients, :mobile
  end
end
