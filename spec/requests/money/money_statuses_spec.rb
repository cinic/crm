require 'rails_helper'

RSpec.describe "MoneyStatuses", :type => :request do
  describe "GET /money/statuses" do
    it "works! (now write some real specs)" do
      get money_statuses_path
      expect(response.status).to be(200)
    end
  end
end
