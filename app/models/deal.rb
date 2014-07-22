class Deal < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :tenant
  belongs_to :agent
  belongs_to :apartment
  belongs_to :user
end
