require 'spec_helper'

RSpec.feature "View Statuatory Obligations Page", type: :feature do
    scenario "Navigate to Statuatory Obligations page" do
        visit "/statuatory_obligations.html"

        expect(page).to have_text("Statuatory Obligations")
    end
end