require "rails_helper"

RSpec.describe "/pages/send.html.erb", type: :feature do
  let(:date_updated) { I18n.t('send.training_in_assistive_technology.last_update').to_date }

  describe "Training in assistive technology section" do
    before do
      visit pages_path(page: "send")
    end

    it "has a title" do
      expect(page).to have_selector('[data-qa="training-assistive-technology"]')
    end
  end
end