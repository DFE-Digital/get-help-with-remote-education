Rails.application.routes.draw do
  root "pages#index"
  get "/:page", to: "pages#show", as: :pages

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
