require "rails_helper"

RSpec.describe "Errors", type: :request do
  describe "#not_found" do
    it "returns a custom 404 page" do
      get "/404"
      expect(response).to have_http_status(:not_found)
    end
  end
end
