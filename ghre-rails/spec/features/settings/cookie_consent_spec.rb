# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Cookie consent", type: :feature do
  before { visit settings_cookie_preferences_path }

  let(:accept_cookie_input) { page.find("[data-qa='cookie-consent-accept']") }
  let(:deny_cookie_input) { page.find("[data-qa='cookie-consent-deny']") }
  let(:submit_preferences) { page.find("[data-qa='submit']") }
  let(:success_message) { page.find("[data-qa='cookie-consent-success-message']") }

  context "Navigating to the page" do
    it "Loads the page with deny selected by default" do
      expect(page).to have_text("Cookie")
      expect(accept_cookie_input).not_to be_checked
      expect(deny_cookie_input).to be_checked
    end
  end

  context "Submitting your cookie preference" do
    describe "Accepting cookies" do
      it "Displays the success message" do
        accept_cookie_input.click
        submit_preferences.click

        expect(success_message).to be_visible
      end

      it "Shows the cookies as currently accepted" do
        accept_cookie_input.click
        submit_preferences.click

        expect(accept_cookie_input).to be_checked
      end
    end

    describe "Rejecting cookies" do
      it "Displays the success message" do
        deny_cookie_input.click
        submit_preferences.click

        expect(success_message).to be_visible
      end

      it "Shows the cookies as currently accepted" do
        deny_cookie_input.click
        submit_preferences.click

        expect(deny_cookie_input).to be_checked
      end
    end
  end
end
