class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASSWORD"] if ENV["BASIC_AUTH_USER"] && ENV["BASIC_AUTH_PASSWORD"]
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  def current_user
    @user ||= Answer.find(session[:answer_id]) if session[:answer_id]
  end
end
