class PagesController < ApplicationController
  def index
    @date = Date.today
  end

  def show
    @today = Date.today
    render template: "pages/#{params[:page].gsub('-', '_')}"
  end
end
