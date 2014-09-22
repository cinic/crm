class Money::Credit < Money::Operation
  def self.total
    calculate(:sum, :amount)
  end
end
