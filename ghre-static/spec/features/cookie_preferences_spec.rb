require 'spec_helper'

RSpec.feature "View Cookie Preferences Page", type: :feature do
    scenario "Navigate to Cookie Preferences page" do
        visit "/cookie_preferences.html"

        expect(page).to have_text("Cookie preferences")
    end
end