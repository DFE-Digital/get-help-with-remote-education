class SettingsController < ApplicationController
  def index; end

  def cookie_preferences
    @consented_to_cookies = cookies[:ghre_allow_cookies] == "true"
  end

  def update_cookie_preferences
    @consented_to_cookies = params["cookie-consent"] == "cookie-consent-accept"

    clear_existing_ga_cookies unless @consented_to_cookies

    cookies[:ghre_allow_cookies] = @consented_to_cookies

    flash.now[:cookie_preferences_updated] = true
    render :cookie_preferences
  end

  private

  def clear_existing_ga_cookies
    ga_cookies = cookies.select { |k, v| k.to_s.starts_with?("_ga") }
    ga_cookies.each { |k, v| cookies.delete(k) }
  end
end
