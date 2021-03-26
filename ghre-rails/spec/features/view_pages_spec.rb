require "rails_helper"

RSpec.feature "View pages", type: :feature do
  scenario "Navigate to index" do
    visit "/"

    expect(page).to have_text("Information, guidance and support for teachers and leaders")
  end

  scenario "Navigate to statutory obligations" do
    visit "/statutory-obligations"

    expect(page).to have_text("Statutory obligations and expectations")
  end
end
