require 'rails_helper'

RSpec.describe "Money::Categories", :type => :request do
  describe "GET /money/categories" do
    it "works! (now write some real specs)" do
      get money_categories_path
      expect(response.status).to be(200)
    end
  end
end
