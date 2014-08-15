require 'rails_helper'

RSpec.describe "WizardLandlords", :type => :request do
  describe "GET /wizard_landlords" do
    it "works! (now write some real specs)" do
      get wizard_landlords_path
      expect(response.status).to be(200)
    end
  end
end
