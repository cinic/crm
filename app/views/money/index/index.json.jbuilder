json.array!(@money) do |money|
  json.extract! money, :id, :contractor, :money_category_id, :amount, :date, :money_status_id, :description, :deal_id
  json.url money_url(money, format: :json)
end
