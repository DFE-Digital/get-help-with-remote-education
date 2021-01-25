require "rails_helper"
require_relative "../../page_objects/review_framework/start_page"
require_relative "../../page_objects/review_framework/task_list"

RSpec.describe "task list page", type: :feature do
  let(:start_page) { PageObjects::ReviewFramework::StartPage.new }
  let(:task_list_page) { PageObjects::ReviewFramework::TaskList.new }

  it "Loads the task list after starting the session" do
    visit review_framework_index_path
    start_page.start_button.click

    expect(page.current_path).to eq(review_framework_task_list_path)
  end

  context "Leadership" do
    before do
      visit review_framework_index_path
      start_page.start_button.click
    end

    it "Allows you to start the leadership section" do
      task_list_page.leadership_link.click
      expect(page.current_path).to eq(questions_path(section: 'leadership', question: 'remote-education-plan'))
    end
  end
end
