require "rails_helper"

RSpec.describe "/pages/send.html.erb", type: :feature do
  let(:date_updated) { I18n.t('send.training_in_assistive_technology.last_update').to_date }

  before do
    visit pages_path(page: "send")
  end

  describe "Training in assistive technology section" do
    it "has a title" do
      
    end
  end
end