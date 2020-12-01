require 'spec_helper'

RSpec.feature "View homepage", type: :feature do
    scenario "Navigate to home" do
        visit "/"

        expect(page).to have_text("Get Help with Remote Education")
    end
end