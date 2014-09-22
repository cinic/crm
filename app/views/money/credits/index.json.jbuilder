json.array!(@money_credits) do |money_credit|
  json.extract! money_credit, :id
  json.url money_credit_url(money_credit, format: :json)
end
