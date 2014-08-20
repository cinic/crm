class Apartment < ActiveRecord::Base
  has_many :deals
  belongs_to :landlord
  belongs_to :user
  has_attached_file :photo, :styles => { :large => "800>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/photo/:style/missing.png", :url => "/upload/:class/:attachment/:id_partition/:style/:filename"
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :address
end
