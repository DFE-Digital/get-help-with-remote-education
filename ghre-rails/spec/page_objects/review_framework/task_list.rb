module PageObjects
  module ReviewFramework
    class TaskList
      include Capybara::DSL

      def leadership_link
        page.find("[data-qa='leadership-link']")
      end

      def recommendations_link
        page.find("[data-qa='recommendations-link']")
      end
    end
  end
end
