module PageObjects
  module ReviewFramework
    class TaskList
      include Capybara::DSL

      def leadership_link
        page.find("[data-qa='leadership-link']")
      end
    end
  end
end
