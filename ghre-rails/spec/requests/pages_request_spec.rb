require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "#show" do
    describe "non-existant page" do
      it "returns a 404 response" do
        expect { get "/a-page-that-does-not-exist" }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end