require "rails_helper"

RSpec.describe ViewHelper, type: :helper do
  describe "#link_to_govuk_content" do
    it "returns an anchor tag with the content url and utm parameters" do
      expect(helper.link_to_govuk_content("TEST LINK", "https://localhost:3000/")).to eq('<a class="govuk-link" href="https://localhost:3000/?utm_source=remote_education">TEST LINK</a>')
    end
  end
end