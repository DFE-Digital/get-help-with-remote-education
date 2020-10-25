require 'spec_helper'

RSpec.feature "View Device Access Page", type: :feature do
    scenario "Navigate to Device Access page" do
        visit "/device_access.html"

        expect(page).to have_text("Device Access")
    end
end