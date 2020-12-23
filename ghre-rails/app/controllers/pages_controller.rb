class PagesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    @today = Date.today
    render template: "pages/#{params[:page].gsub('-', '_')}"
  end
end
