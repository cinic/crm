json.array!(@money_statuses) do |money_status|
  json.extract! money_status, :id, :description
  json.url money_status_url(money_status, format: :json)
end
