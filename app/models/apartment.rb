class Apartment < ActiveRecord::Base
  has_many :deals
  has_many :assets, dependent: :destroy
  belongs_to :landlord
  belongs_to :user
  #has_attached_file :photo, :styles => { :large => "800>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/photo/:style/missing.png", :url => "/upload/:class/:attachment/:id_partition/:style/:filename"
  
  #validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :address
  #accepts_nested_attributes_for :assets, reject_if: :all_blank
end
