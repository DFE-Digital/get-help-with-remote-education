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

  describe "Update summary" do
    let(:date_updated) { I18n.t('send.training_in_assistive_technology.last_update').to_date }

    it 'is visible when update date is within the past two weeks' do
      Timecop.freeze(date_updated + 5.days) do
        visit pages_path(page: "send")
        expect(page).to have_selector('[data-qa="training-in-assistive-technology-update-summary"]')
        expect(page.find('[data-qa="training-in-assistive-technology-update-summary"]')).to be_visible
      end
    end
    
    it 'is visible for two weeks' do
      Timecop.freeze(date_updated + 2.weeks) do
        visit pages_path(page: "send")
        expect(page).to have_selector('[data-qa="training-in-assistive-technology-update-summary"]')
        expect(page.find('[data-qa="training-in-assistive-technology-update-summary"]')).to be_visible
      end
    end
  
  end
end