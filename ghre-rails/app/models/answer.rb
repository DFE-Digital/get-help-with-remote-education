class Answer < ApplicationRecord
  validates :reference_code, presence: true, 
                             uniqueness: true
  has_one :detail

  def save_answer(section:, question:, answer:); end
end
