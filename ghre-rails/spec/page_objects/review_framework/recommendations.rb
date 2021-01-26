module PageObjects
  module ReviewFramework
    class Recommendations
      include Capybara::DSL

      def scores
        leadership_section = page.find('[data-qa="leadership"]')
        {
          leadership: {
            remote_education_plan: score_for_section(leadership_section, 'remote-education-plan').text,
            communication: score_for_section(leadership_section, 'communication').text,
            monitoring_and_evaluating: score_for_section(leadership_section, 'monitoring-and-evaluating').text
          },
        }
      end

    private

      def score_for_section(section, question)
        section.find("[data-qa='#{question}']")
      end
    end
  end
end
