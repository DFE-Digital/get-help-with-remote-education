require "rails_helper"
require_relative "../../page_objects/review_framework/start_page"
require_relative "../../page_objects/review_framework/task_list"
require_relative "../../page_objects/review_framework/question"
require_relative "../../page_objects/review_framework/recommendations"

RSpec.describe "Getting recommendations", type: :feature do
  before { visit review_framework_index_path }

  let(:start_page) { PageObjects::ReviewFramework::StartPage.new }
  let(:task_list_page) { PageObjects::ReviewFramework::TaskList.new }
  let(:question_page) { PageObjects::ReviewFramework::Question.new }
  let(:recommendations_page) { PageObjects::ReviewFramework::Recommendations.new }
  let(:answers) do
    answers = create(:answer, :blank_answer)
    answers.leadership = Leadership.new(remote_education_plan: 1, communication: 2, monitoring_and_evaluating: 3)
    answers.leadership.save!
    answers.save!
    answers
  end

  context "Viewing the recommendations page" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(answers)
    end

    it "displays the answers chosen" do
      visit results_path
      expect(recommendations_page.scores).to eq({ leadership: { remote_education_plan: "1", communication: "2", monitoring_and_evaluating: "3" } })
    end
  end
end
