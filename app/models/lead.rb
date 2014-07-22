class Lead < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :landlord
end
