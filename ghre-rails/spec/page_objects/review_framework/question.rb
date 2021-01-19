module PageObjects
  module ReviewFramework
    class Question
      include Capybara::DSL

      def title
        page.find("[data-qa='question-title']")
      end

      def submit_answer(score)
        case score
        when 1
          page.find("label[for='score-id-1-field']").click
        end

        submit
      end

      def submit
        page.find("input[type='submit']").click
      end
    end
  end
end
