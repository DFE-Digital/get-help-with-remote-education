class Answer < ApplicationRecord
  validates :reference_code, presence: true, 
                             uniqueness: true
  has_one :detail
  has_one :leadership

  def save_answer(section:, question:, answer:); end
end
