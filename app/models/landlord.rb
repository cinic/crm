class Landlord < ActiveRecord::Base
  has_many :leads

  validates_presence_of :name
  validates_presence_of :mobile
end
