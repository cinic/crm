class AddAttachmentPhotoToApartments < ActiveRecord::Migration
  def self.up
    change_table :apartments do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :apartments, :photo
  end
end
