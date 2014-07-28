require 'rails_helper'

RSpec.describe "Apartments", :type => :request do
  describe "GET /apartments" do
    it "works! (now write some real specs)" do
      get apartments_path
      expect(response.status).to be(200)
    end
  end
end
