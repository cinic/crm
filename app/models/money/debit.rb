class Money::Debit < Money::Operation
  def self.total
    calculate(:sum, :amount)
  end
end
