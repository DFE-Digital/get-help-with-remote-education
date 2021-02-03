class Answer < ApplicationRecord
  validates :reference_code, presence: true,
                             uniqueness: true
  has_one :detail
  has_one :leadership

  def submit_answer(section:, question:, answer:)
    case section
    when :leadership
      create_leadership unless leadership
      leadership[question] = answer
      leadership.save!
    end
  end

  def answers_to_hash
    answers = {}
    answers[:leadership] = {
      remote_education_plan: leadership.remote_education_plan,
      communication: leadership.communication,
      monitoring_and_evaluating: leadership.monitoring_and_evaluating,
    }

    answers
  end
end
