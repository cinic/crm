json.array!(@money_debits) do |money_debit|
  json.extract! money_debit, :id
  json.url money_debit_url(money_debit, format: :json)
end
