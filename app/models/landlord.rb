class Landlord < Client
  has_many :leads
  has_many :deals
  has_many :apartments

  validates :mobile,
            presence: true,
            uniqueness: true
end
