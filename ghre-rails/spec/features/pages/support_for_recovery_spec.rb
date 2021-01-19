require "rails_helper"

RSpec.describe "page/support_for_recover.html.erb", type: :feature do
  describe "GET pages/support-for-recovery" do
    it "links to school-to-school programme" do
      visit pages_path(page: "support-for-recovery")

      expect(page).to have_selector('a[href="https://www.gov.uk/government/publications/school-leadership-support/school-leadership-support?utm_source=remote_education"]',
                                    text: 'school-to-school support programme')
    end
  end
end