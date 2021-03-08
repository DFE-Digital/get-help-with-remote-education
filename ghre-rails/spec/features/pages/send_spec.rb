require "rails_helper"

RSpec.describe "/pages/send.html.erb", type: :feature do
  let(:date_updated) { I18n.t("send.last_update_date").to_date }

  describe "Update summary" do
    let(:date_updated) { I18n.t("send.last_update_date").to_date }

    it "should have one update badge" do
      Timecop.freeze(date_updated + 5.days) do
        visit pages_path(page: "send")
        expect(page.find_all('[data-qa="update-summary"]').count).to eq(1)
      end
    end

    it "is visible when update date is within the past two weeks" do
      Timecop.freeze(date_updated + 5.days) do
        visit pages_path(page: "send")
        expect(page).to have_selector('[data-qa="update-summary"]')
        expect(page.find('[data-qa="update-summary"]')).to be_visible
      end
    end

    it "is visible for two weeks" do
      Timecop.freeze(date_updated + 2.weeks) do
        visit pages_path(page: "send")
        expect(page).to have_selector('[data-qa="update-summary"]')
        expect(page.find('[data-qa="update-summary"]')).to be_visible
      end
    end

    it "is not rendered after 2 weeks" do
      Timecop.freeze(date_updated + 15.days) do
        visit pages_path(page: "send")
        expect(page).not_to have_selector('[data-qa="update-summary"]')
      end
    end

    describe "when toggled" do
      before { Timecop.freeze(date_updated) }
      after { Timecop.return }

      describe "with content hidden" do
        before do
          visit pages_path(page: "send")
        end

        it "should default to hiding the content" do
          expect(page).to have_selector('[data-qa="update-summary__hidden"]')
        end

        it "should have the button for showing updates" do
          expect(page).to have_selector('[data-qa="update-summary-toggle__show"]')
        end

        it "should allow the user to show updates" do
          page.find('[data-qa="update-summary-toggle__show"]').click
          expect(page).to have_selector('[data-qa="update-summary-toggle__hide"]')
          expect(page).to have_selector('[data-qa="update-summary__visible"]')
        end
      end

      describe "with content showing" do
        before do
          visit pages_path(page: "send", show_updates: true)
        end

        it "should show the content" do
          expect(page).to have_selector('[data-qa="update-summary__visible"]')
        end

        it "should highlight the updated sections" do
          expect(page).to have_selector('[data-qa="updated-content__highlighted"]')
        end

        it "should have the button for hiding updates" do
          expect(page).to have_selector('[data-qa="update-summary-toggle__hide"]')
        end

        it "should allow the user to hide updates" do
          page.find('[data-qa="update-summary-toggle__hide"]').click
          expect(page).to have_selector('[data-qa="update-summary-toggle__show"]')
          expect(page).to have_selector('[data-qa="update-summary__hidden"]')
        end
      end
    end
  end
end
