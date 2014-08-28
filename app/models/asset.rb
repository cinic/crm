class Asset < ActiveRecord::Base
  belongs_to :apartment

  has_attached_file :image, :styles => { :large => "600>", :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/photo/:style/missing.png", :url => "/upload/:class/:attachment/:id_partition/:style/:filename"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
