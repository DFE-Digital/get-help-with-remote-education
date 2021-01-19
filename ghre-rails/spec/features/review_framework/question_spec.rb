require "rails_helper"
require_relative "../../page_objects/review_framework/start_page"
require_relative "../../page_objects/review_framework/question"

RSpec.describe "Submitting a series of answers", type: :feature do
  before { visit review_framework_index_path }

  let(:start_page) { PageObjects::ReviewFramework::StartPage.new }
  let(:question_page) { PageObjects::ReviewFramework::Question.new }

  context "navigate to question page" do
    it "Loads the first question when clicking the start button" do
      start_page.start_button.click

      expect(question_page.title).to be_visible
    end
  end

  context "Answering the first leadership question" do
    let(:answers) { Answer.last }

    before do 
      visit review_framework_index_path 
      start_page.start_button.click
    end

    it "Updates the saved answers" do
      question_page.submit_answer(1)
      expect(answers.leadership.remote_education_plan).to eq(1)
    end
  end
end
