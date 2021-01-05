require "rails_helper"

RSpec.describe ReviewFrameworkController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET start' do
    it 'has a 302 status' do
      get :start
      expect(response.status).to eq(302)
    end

    it 'redirects to the first question' do
      get :start
      expect(response).to redirect_to(question_path(section: :start, question: :which_educational_stage))
    end
  end
end