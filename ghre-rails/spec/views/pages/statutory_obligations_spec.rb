require 'rails_helper'

RSpec.describe 'pages/statutory_obligations.html.erb', type: :view do
  before(:each) do
    @date = Date.today
    @show_updates = show_updates
  end

  context 'show_updates is true' do
    let(:show_updates) { "true" }
    let(:html) { render template: 'pages/statutory_obligations'}

    it 'should have css for highlighting changes' do
      expect(html).to have_css(".updated-content.active", text: "Recording in the attendance register")
    end
  end

  context 'show_updates is false' do
    let(:show_updates) { "false" }
    let(:html) { render template: 'pages/statutory_obligations'}

    it 'should have no css for highlighting changes' do
      expect(html).to have_no_css(".updated-content.active", text: "Recording in the attendance register")
    end
  end
end
