require 'rails_helper'

RSpec.describe "Money", :type => :request do
  describe "GET /money" do
    it "works! (now write some real specs)" do
      get money_index_path
      expect(response.status).to be(200)
    end
  end
end
