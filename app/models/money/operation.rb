class Money::Operation < ActiveRecord::Base
  belongs_to :category
  belongs_to :status
  belongs_to :deal
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates_presence_of :contractor, :amount, :date, :status, :category, :type

  def amount_direction
    self.type.downcase.match('debit') ? '+' : '-' 
  end

  def self.total
    calculate(:sum, :amount)
  end
end
