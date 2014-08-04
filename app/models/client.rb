class Client < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :mobile
end
