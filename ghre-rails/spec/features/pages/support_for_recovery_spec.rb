require "rails_helper"

RSpec.describe "page/support_for_recovery.html.erb", type: :feature do
  describe "GET pages/support-for-recovery" do
    it "links to recovery information" do
      visit pages_path(page: "support-for-recovery")

      expect(page).to have_selector('a[href="https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/993053/Education_recovery_support_June-2021.pdf?utm_source=remote_education"]',
                                    text: "information for early years settings, schools and providers of 16-19 education")
    end
  end
end
