class Apartment < ActiveRecord::Base
  has_many :deals
  belongs_to :landlord
  belongs_to :user

  validates_presence_of :address
end
