json.array!(@money_categories) do |money_category|
  json.extract! money_category, :id, :description
  json.url money_category_url(money_category, format: :json)
end
