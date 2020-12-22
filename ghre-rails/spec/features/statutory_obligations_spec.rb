require 'rails_helper'

RSpec.describe 'pages/statutory_obligations.html.erb', type: :feature do
  let(:show_hide_changes) { page.find("[data-qa='show-hide-updates']")}

  describe 'update summary badge' do
    it 'should visible for up to 2 weeks' do
      allow(Date).to receive(:today).and_return I18n.t('statutory_obligations.schools.last_update').to_date + 2.weeks
      visit pages_path(page: "statutory-obligations")

      expect(page.find("[data-qa='update-summary']")).to be_visible
    end
  end
end
