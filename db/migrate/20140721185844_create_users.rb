class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_salt, null: false
      t.string :password_hash, null: false
      t.integer :role, null: false
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip
      t.string :mobile

      t.timestamps
    end
  end
end
