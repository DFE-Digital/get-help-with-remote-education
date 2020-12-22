require 'rails_helper'

describe Answers do
  it 'is unique' do
    a = Answers.new(reference_code: 'meow')
    a.save!

    b = Answers.new(reference_code: 'meow')

    expect(b.valid?).to be false
  end
end
