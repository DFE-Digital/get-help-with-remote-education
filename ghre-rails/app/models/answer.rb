class Answer < ApplicationRecord
  validates :reference_code, presence: true, 
                             uniqueness: true
end
