class Landlord < Client
  has_many :leads
  has_many :deals
  has_many :apartments
end
