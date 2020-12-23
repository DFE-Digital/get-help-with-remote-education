class Answers < ApplicationRecord
  validates_uniqueness_of :reference_code
  has_one :leadership_answers

  def submit_answer(section:, question:, answer:)
    case section
    when 'leadership'
      create_leadership_answers unless leadership_answers
      leadership_answers[question] = answer
      leadership_answers.save!
    end
  end
end