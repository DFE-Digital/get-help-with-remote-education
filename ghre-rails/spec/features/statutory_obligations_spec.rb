require "rails_helper"

RSpec.describe "pages/statutory_obligations.html.erb", type: :feature do
  let(:date_updated) { I18n.t("statutory_obligations.schools.last_update").to_date }

  describe "update summary badge" do
    it "should visible for up to 2 weeks" do
      Timecop.freeze(date_updated + 2.weeks) do
        visit pages_path(page: "statutory-obligations")

        expect(page.find('[data-qa="schools-update-summary"]')).to be_visible
      end
    end

    it "should not be visible after 2 weeks" do
      Timecop.freeze(date_updated + 15.days) do
        visit pages_path(page: "statutory-obligations")

        expect(page).not_to have_selector('[data-qa="schools-update-summary"]')
      end
    end
  end

  describe "toggling update summaries" do
    before { Timecop.freeze(date_updated) }
    after { Timecop.return }

    context "with updates hidden" do
      before do
        visit pages_path(page: "statutory-obligations")
      end

      it "should default to hiding the update summary" do
        expect(page).to have_selector('[data-qa="update-summary__hidden"]')
      end

      it "should show the toggle button for showing updates" do
        expect(page).to have_selector('[data-qa="update-summary-toggle__show"]')
      end

      it "allows the user to toggle the update summary" do
        page.find('[data-qa="update-summary-toggle__show"]').click

        expect(page).to have_selector('[data-qa="update-summary__visible"]')
        expect(page).to have_selector('[data-qa="update-summary-toggle__hide"]')
      end
    end

    context "with updates shown" do
      before do
        visit pages_path(page: "statutory-obligations", show_updates: true)
      end

      it "should default to hiding the update summary" do
        expect(page).to have_selector('[data-qa="update-summary__visible"]')
      end

      it "should show the toggle button for showing updates" do
        expect(page).to have_selector('[data-qa="update-summary-toggle__hide"]')
      end

      it "allows the user to toggle the update summary" do
        page.find('[data-qa="update-summary-toggle__hide"]').click

        expect(page).to have_selector('[data-qa="update-summary__hidden"]')
        expect(page).to have_selector('[data-qa="update-summary-toggle__show"]')
      end
    end
  end
end
