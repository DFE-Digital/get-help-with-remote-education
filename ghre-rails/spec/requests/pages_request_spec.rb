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
      get "/get-help-with-technology"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to('https://get-help-with-tech.education.gov.uk/')
    end

    it "redirects to the remote education provision review framework" do
      get "/review-your-remote-education-provision"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to('https://www.gov.uk/government/publications/review-your-remote-education-provision?utm_source=remote_education')
    end
  end
end