require "rails_helper"

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET index" do
    it "renders date_badge partial 5 times" do
      get :index
      expect(response).to render_template(partial: '_date_badge', count: 5)
    end
  end
end