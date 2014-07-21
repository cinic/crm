class Deal < ActiveRecord::Base
  belongs_to :employer
  belongs_to :renter
  belongs_to :agent
  belongs_to :apartment
  belongs_to :user
end
