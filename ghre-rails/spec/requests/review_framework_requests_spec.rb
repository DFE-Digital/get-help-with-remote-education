require "rails_helper"

RSpec.describe ReviewFrameworkController, type: :request do

  describe "GET review-framework/index" do
    it "returns http success" do
      get review_framework_index_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET review-framework/start" do
    describe "for new answer" do
      before do
        get review_framework_start_path
      end

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)
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
        get(review_framework_start_path)
      end

      it "returns http redirect" do
        expect(response).to have_http_status(:redirect)     
      end

      it "does not change the session id" do
        expect(session[:answer_id]).to eq(1)
      end

      it "does not create a new answer" do
        expect(Answer.count).to eq(0)
      end
    end
  end
end