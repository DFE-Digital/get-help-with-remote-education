class PagesController < ApplicationController
  def index
    @date = Date.today
  end

  def show
    @date = Date.today
    @show_updates = params[:show_updates]
    render template: "pages/#{params[:page].gsub('-', '_')}"
  end
end
