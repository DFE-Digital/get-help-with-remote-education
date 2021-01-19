require 'rails_helper'

RSpec.describe Leadership, type: :model do
  it { should belong_to(:answer).class_name('Answer') } 
end

