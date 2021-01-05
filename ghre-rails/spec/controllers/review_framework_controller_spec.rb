require "rails_helper"

RSpec.describe ReviewFrameworkController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end