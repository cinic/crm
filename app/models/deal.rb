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

  validates_presence_of :price
  validates_presence_of :deposit
  validates_presence_of :lease_term
  validates_presence_of :commission

  scope :this_month, -> { where(created_at: Date.today.beginning_of_month..Date.today.end_of_month) }

end
