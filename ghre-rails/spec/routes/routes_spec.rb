require "rails_helper"

RSpec.describe "Routes", type: :routing do
  describe "Error routing" do
    it "routes to #not_found when page does not exist" do
      expect(get: "404").to route_to "errors#not_found"
    end
  end
end
