json.array!(@money) do |money|
  json.extract! money, :id, :contractor, :amount, :date, :description, :category, :status, :deal
  json.url money_path(money, format: :json)
end