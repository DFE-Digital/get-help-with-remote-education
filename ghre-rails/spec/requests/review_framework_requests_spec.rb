require "rails_helper"

RSpec.describe ReviewFrameworkController, type: :request do

  describe "GET #index" do
    it "returns http success" do
      get review_framework_index_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #start" do
    describe "for new answer" do
      before { get review_framework_start_path }

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
      end
      
      it 'redirects to the first question' do
        expect(response).to redirect_to(questions_path(section: :details, question: :'which-educational-stage'))
      end  

      it "creates a session id" do
        expect(session[:answer_id]).to_not be_nil
      end

      it "creates a new answer" do
        expect(Answer.count).to eq(1)
      end
    end

    describe "with existing answer" do
      before do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { answer_id: 1 } }
        get review_framework_start_path
      end

      it "does not change the session id" do
        expect(session[:answer_id]).to eq(1)
      end

      it "does not create a new answer" do
        expect(Answer.count).to eq(0)
      end
    end
  end

  describe "POST #submit_answer" do
    let(:mock_answer) { double("mock_answer", save_answer: true) }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(mock_answer) }

    it "returns http redirect" do
      post submit_answer_path(section: :details, question: :'which-educational-stage')
      expect(response).to have_http_status(:redirect)
    end

    it "calls the submit_answer method" do
      expect(mock_answer).to receive(:save_answer).exactly(1).times
      post submit_answer_path(section: :details, question: :'which-educational-stage')
    end
  end

  describe 'GET #question' do
    it 'returns http success' do
      get questions_path(section: :details, question: :'which-educational-stage')
      expect(response).to have_http_status(:success)
    end
  end
end