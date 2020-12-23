class PagesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    @today = Date.today
    @show_updates = params[:show_updates] == "true"
    render template: "pages/#{params[:page].gsub('-', '_')}"
  end
end
