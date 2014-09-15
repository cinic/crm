require 'rails_helper'

RSpec.describe "FeedbackMessages", :type => :request do
  describe "GET /feedback_messages" do
    it "works! (now write some real specs)" do
      get feedback_messages_path
      expect(response.status).to be(200)
    end
  end
end
