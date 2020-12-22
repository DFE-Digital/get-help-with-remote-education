class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASSWORD"] if ENV["BASIC_AUTH_USER"] && ENV["BASIC_AUTH_PASSWORD"]

  helper_method :current_user

  def current_user
    @user ||= Answers.find(session[:answers_id])
  end
end
