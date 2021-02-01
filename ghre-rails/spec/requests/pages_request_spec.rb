require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "#show" do
    describe "non-existant page" do
      it "returns a 404 response" do
        expect { get "/a-page-that-does-not-exist" }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe "external redirects" do
    it "redirects to get-help-with-tech" do
      get "/get-help-with-tech"
      expect(response).to have_http_status(:redirect)
    end
  end
end