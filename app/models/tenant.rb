class Tenant < Client
  has_many :deals

  validates :mobile,
            presence: true,
            uniqueness: true
end
