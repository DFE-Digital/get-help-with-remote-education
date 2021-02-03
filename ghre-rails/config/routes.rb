Rails.application.routes.draw do
  root "pages#index"

  constraints(->(_) { ENV["ENABLE_REVIEW_FRAMEWORK"] == "true" }) do
    scope "/review-framework" do
      get "/", to: "review_framework#index", as: :review_framework_index
      get "/task-list", to: "review_framework#task_list", as: :review_framework_task_list
      get "/start", to: "review_framework#start", as: :review_framework_start
      get "/recommendations", to: "review_framework#recommendations", as: :review_framework_recommendations
      get "/input-email", to: "review_framework#input_email"
      post "/input-email", to: "review_framework#send_email", as: :review_Framework_submit_login_email

      get "/:section", to: "review_framework#section", as: :review_framework_section
      get "/:section/:question", to: "review_framework#question", as: :questions
      post "/:section/:question", to: "review_framework#submit_answer", as: :submit_answer
    end
  end

  # redirects
  get "/review-your-remote-education-provision", to: redirect("https://www.gov.uk/government/publications/review-your-remote-education-provision?utm_source=remote_education")
  get "/get-help-with-technology", to: redirect("https://get-help-with-tech.education.gov.uk/")
  get "/rapid-testing", to: redirect("https://www.gov.uk/guidance/asymptomatic-testing-in-schools-and-colleges")

  get "/settings/cookie-preferences", to: "settings#cookie_preferences"
  post "/settings/cookie-preferences", to: "settings#update_cookie_preferences"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  get "/:page", to: "pages#show", as: :pages
end
