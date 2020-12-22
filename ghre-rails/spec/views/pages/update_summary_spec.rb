require 'rails_helper'

RSpec.describe 'pages/update_summary.html.erb', type: :view do
  context 'update_date is over 2 weeks ago' do
    let(:last_update) { Date.today }
    let(:shifted_date) { last_update + 15.day }
    let(:show_updates) { "true" }
    let(:updated_sections) { [{ :description => "Recording in the attendance register", :id => "attendance-register" }] }
    let(:html) { render 'update_summary', show_updates: show_updates, today: shifted_date, update_date: last_update, updated_sections: updated_sections}

    it 'does not render any html' do
      expect(html).to have_no_text("updated")
    end
  end

  context 'update_date is under 2 weeks ago' do
    let(:last_update) { Date.today }
    let(:shifted_date) { last_update + 7.day }
    let(:show_updates) { "true" }
    let(:updated_sections) { [{ :description => "Recording in the attendance register", :id => "attendance-register" }] }
    let(:html) { render 'update_summary', show_updates: show_updates, today: shifted_date, update_date: last_update, updated_sections: updated_sections}

    it 'renders html' do
      expect(html).to have_text("updated")
    end
  end
end
