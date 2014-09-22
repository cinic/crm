require 'rails_helper'

RSpec.describe "Money::Credits", :type => :request do
  describe "GET /money/credits" do
    it "works! (now write some real specs)" do
      get money_credits_path
      expect(response.status).to be(200)
    end
  end
end
