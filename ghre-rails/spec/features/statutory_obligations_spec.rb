require 'rails_helper'

RSpec.describe 'pages/statutory_obligations.html.erb', type: :feature do
  before(:each) do
    visit pages_path(page: "statutory-obligations", show_updates: show_updates)
  end

  let(:show_changes_input) { page.find("[data-qa='updates-show']")}
  let(:hide_changes_input) { page.find("[data-qa='updates-hide']")}
  let(:show_updates) { show_updates }

  context 'show_updates is false' do
    let(:content) { page.find("[data-qa='active-updated-content']")}
    let(:show_updates) { "false" }

    it 'should have content changes highlighted when show changes link is clicked' do
      show_changes_input.click
      expect(content).to be_visible
    end
  end

  context 'show_updates is true' do
    let(:content) { page.find("[data-qa='inactive-updated-content']")}
    let(:show_updates) { "true" }

    it 'should hide content changes highlighted when hide changes link is clicked' do
      hide_changes_input.click
      expect(content).to be_visible
    end
  end
end
