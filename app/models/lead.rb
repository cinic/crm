class Lead < ActiveRecord::Base
  belongs_to :landlord
  has_one :apartment, through: :landlord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :mobile

end
