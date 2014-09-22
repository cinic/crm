class User < ActiveRecord::Base
  include Authentication
  
  scope :realtors, -> { where(role: 2) }
  scope :managers, -> { where(role: 1) }
  scope :admins, -> { where(role: 0) }
end
