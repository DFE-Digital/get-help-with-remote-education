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

      it "redirects to the first question" do
        expect(response).to redirect_to(review_framework_task_list_path)
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

  describe "GET #section" do
    context "Leadership" do
      it "Redirects to the first leadership question" do
        get review_framework_section_path(section: "leadership")
        expect(response).to redirect_to(questions_path(section: :leadership, question: :'remote-education-plan'))
      end
    end
  end

  describe "POST #submit_answer" do
    let(:mock_answer) { double("mock_answer", submit_answer: true, save!: true) }

    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(mock_answer) }

    it "returns http redirect" do
      post submit_answer_path(section: "leadership", question: "remote-education-plan")
      expect(response).to have_http_status(:redirect)
    end

    it "calls the submit_answer method" do
      post submit_answer_path(section: "leadership", question: "remote-education-plan", score_id: "3")
      expect(mock_answer).to have_received(:submit_answer).with(section: :leadership, question: :remote_education_plan, answer: 3)
    end

    it "Redirects to the next question" do
      post submit_answer_path(section: "leadership", question: "remote-education-plan", score_id: "3")
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(questions_path(section: "leadership", question: "communication"))
    end

    context "Submitting a score for the final question in a section" do
      it "Redirects to the task list page" do
        post submit_answer_path(section: "leadership", question: "monitoring-and-evaluating", score_id: "3")
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(review_framework_task_list_path)
      end
    end
  end

  describe "GET #question" do
    it "returns http success" do
      get questions_path(section: :details, question: :'which-educational-stage')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #recommendations" do
    before do
      answer = create(:answer, :blank_answer)
      answer.leadership = Leadership.new(remote_education_plan: 1, communication: 2, monitoring_and_evaluating: 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(answer)

      get review_framework_recommendations_path
    end

    it "Renders the recommendations page" do
      expect(response.body).to include(I18n.t("review_framework.recommendations.title"))
    end
  end
end
