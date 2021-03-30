require "rails_helper"

RSpec.describe "Home page", type: :feature do
  describe "GET index" do
    it "renders date_badge partial 5 times" do
      visit root_path
      expect(page.find_all("[data-qa='date-badge']").count).to eq(5)
    end

    describe "review framework banner" do
      it "links to the review framework" do
        visit root_path
        expect(page).to have_selector('a[href="/"]')
      end
    end
  end
end
