class PagesController < ApplicationController
  def index
    @today = Time.zone.today
  end

  def show
    @today = Time.zone.today
    @show_updates = params[:show_updates] == "true"

    begin
      render template: "pages/#{params[:page].gsub('-', '_')}"
    rescue ActionView::MissingTemplate
      not_found
    end
  end

private

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
