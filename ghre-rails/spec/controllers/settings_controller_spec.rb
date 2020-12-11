require "rails_helper"

RSpec.describe SettingsController, type: :controller do
  describe "POST #update_cookie_preferences" do
    it "Sets allows cookies for the user" do
      post :update_cookie_preferences, params: { "cookie-consent": "cookie-consent-accept" }
      expect(cookies[:ghre_allow_cookies]).to eq(true)
    end

    describe "Denying cookies" do
      it "Sets deny cookies for the user" do
        post :update_cookie_preferences, params: { "cookie-consent": "cookie-consent-deny" }
        expect(cookies[:ghre_allow_cookies]).to eq(false)
      end

      it "Clears existing GA cookies" do
        cookies[:_ga] = "test"
        cookies[:_ga_someID] = "test"

        post :update_cookie_preferences, params: { "cookie-consent": "cookie-consent-deny" }

        expect(response.cookies[:_ga]).to be_nil
        expect(response.cookies[:_ga_someID]).to be_nil
      end
    end
  end
end
