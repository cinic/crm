module Money::IndexHelper
  def edit_money_path(money)
    case money.type.to_s.downcase
      when "money::credit" then edit_money_credit_path(money)
      when "money::debit" then edit_money_debit_path(money)
    end
  end

  def money_path(money, format=:html)
    case money.type.to_s.downcase
      when "money::credit" then money_credit_path(money, format)
      when "money::debit" then money_debit_path(money, format)
    end
  end

  def total_amount
    Money::Debit.total - Money::Credit.total
  end
  def total_debit
    Money::Debit.total
  end
  def total_credit
    Money::Credit.total
  end
end
