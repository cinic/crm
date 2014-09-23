class AddRoomAndPriceAndCommentToClient < ActiveRecord::Migration
  def change
    add_column :clients, :room, :integer
    add_column :clients, :price, :decimal, precision: 10, scale: 2
    add_column :clients, :comment, :text
  end
end
