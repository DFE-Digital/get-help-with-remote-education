class PagesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    @today = Date.today
    @show_updates = params[:show_updates] == "true"
    
    begin
      render template: "pages/#{params[:page].gsub('-', '_')}"
    rescue ActionView::MissingTemplate
      not_found
    end
  end

  private

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
