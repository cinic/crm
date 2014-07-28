class Apartment < ActiveRecord::Base

  validates_presence_of :metro
  validates_presence_of :address
end
