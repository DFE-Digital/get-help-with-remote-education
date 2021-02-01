require "rails_helper"

RSpec.describe "index", type: :feature do
  before { visit review_framework_index_path }

  let(:title) { page.find("[data-qa='framework-title']") }
  let(:start_button) { page.find("[data-qa='start-button']") }

  context "navigate to start page" do
    it "loads the start page with the title" do
      expect(page).to have_text(I18n.t("review_framework.title"))
      expect(title).to be_visible
    end

    it "should display the start button" do
      expect(start_button).to be_visible
      expect(start_button).to have_text("Start now")
    end
  end
end
