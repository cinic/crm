json.array!(@wizard_landlords) do |wizard_landlord|
  json.extract! wizard_landlord, :id
  json.url wizard_landlord_url(wizard_landlord, format: :json)
end
