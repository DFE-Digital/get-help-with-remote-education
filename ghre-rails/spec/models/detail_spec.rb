require 'rails_helper'

RSpec.describe Detail, type: :model do
  it { should belong_to(:answer).class_name('Answer') } 
end
