module PageObjects
  module ReviewFramework
    class Question
      include Capybara::DSL

      def title
        page.find("[data-qa='question-title']")
      end

      def submit_answer(score)
        page.find("label[for='score-id-#{score}-field']").click
        submit
      end

      def submit
        page.find("input[type='submit']").click
      end
    end
  end
end
