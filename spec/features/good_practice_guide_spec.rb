require 'spec_helper'

RSpec.feature "View Remote Education Good Practice Page", type: :feature do
    scenario "Navigate to Good Practice Guide page" do
        visit "/good_practice_guide.html"

        expect(page).to have_text("Remote Education Good Practice Guide")
    end
end