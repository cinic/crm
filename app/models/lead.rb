class Lead < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :landlord

  validates_presence_of :name
  validates_presence_of :mobile
end
