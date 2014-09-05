class Metro < ActiveRecord::Base

  scope :moscow, -> { where(city: "Москва") }
end
