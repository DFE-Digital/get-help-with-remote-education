class Answers < ApplicationRecord
  validates_uniqueness_of :reference_code
  has_one :leadership_answers
end