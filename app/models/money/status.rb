class Money::Status < ActiveRecord::Base
  validates_presence_of :description
end
