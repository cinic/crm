require 'rails_helper'

RSpec.describe "Money::Debits", :type => :request do
  describe "GET /money/debits" do
    it "works! (now write some real specs)" do
      get money_debits_path
      expect(response.status).to be(200)
    end
  end
end
