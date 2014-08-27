class Asset < ActiveRecord::Base
  belongs_to :apartment

  has_attached_file :image, :styles => { :large => "800>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/photo/:style/missing.png", :url => "/upload/:class/:attachment/:id_partition/:style/:filename"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
