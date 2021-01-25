require "rails_helper"
require_relative "../../page_objects/review_framework/start_page"
require_relative "../../page_objects/review_framework/task_list"
require_relative "../../page_objects/review_framework/question"

RSpec.describe "Submitting a series of answers", type: :feature do
  before { visit review_framework_index_path }

  let(:start_page) { PageObjects::ReviewFramework::StartPage.new }
  let(:task_list_page) { PageObjects::ReviewFramework::TaskList.new }
  let(:question_page) { PageObjects::ReviewFramework::Question.new }

  context "navigate to question page" do
    it "Loads the first question when clicking the section link" do
      start_page.start_button.click
      task_list_page.leadership_link.click

      expect(question_page.title).to be_visible
    end
  end

  context "Answering the first leadership question" do
    let(:answers) { Answer.last }

    before do
      visit review_framework_index_path
      start_page.start_button.click
      task_list_page.leadership_link.click
    end

    it "Updates the saved answers" do
      question_page.submit_answer(1)
      expect(answers.leadership.remote_education_plan).to eq(1)
    end

    it "navigates to the next question" do
      question_page.submit_answer(1)
      expect(page.current_path).to eq(questions_path(:leadership, :communication))
    end
  end

  context "Answering the last leadership question" do
    let(:answers) { Answer.last }

    before do
      visit review_framework_index_path
      start_page.start_button.click
      task_list_page.leadership_link.click
      question_page.submit_answer(1)
      question_page.submit_answer(1)
    end
    
    it "Takes the user to the task list page" do
      question_page.submit_answer(1)
      expect(page.current_path).to eq(review_framework_task_list_path)
    end
  end
end
