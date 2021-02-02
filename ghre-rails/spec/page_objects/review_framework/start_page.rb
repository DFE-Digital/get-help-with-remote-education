module PageObjects
  module ReviewFramework
    class StartPage
      include Capybara::DSL

      def title
        page.find("[data-qa='framework-title']")
      end

      def start_button
        page.find("[data-qa='start-button']")
      end
    end
  end
end
