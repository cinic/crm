class Deal < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :tenant
  belongs_to :agent
  belongs_to :apartment
  belongs_to :user

  validates_presence_of :landlord
  validates_presence_of :tenant
  validates_presence_of :apartment
  validates_presence_of :user
end
