Rails.application.routes.draw do
  root "pages#index"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  # redirects
  get "/review-your-remote-education-provision", to: redirect("https://www.gov.uk/government/publications/review-your-remote-education-provision?utm_source=remote_education")
  get "/get-help-with-technology", to: redirect("https://get-help-with-tech.education.gov.uk/")
  get "/rapid-testing", to: redirect("https://www.gov.uk/guidance/asymptomatic-testing-in-schools-and-colleges")

  get "/:page", to: "pages#show", as: :pages

  get "/settings/cookie-preferences", to: "settings#cookie_preferences"
  post "/settings/cookie-preferences", to: "settings#update_cookie_preferences"
end
