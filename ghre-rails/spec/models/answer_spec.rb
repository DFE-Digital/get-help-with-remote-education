require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is not valid without reference_code" do
    subject.reference_code = nil
    expect(subject).to_not be_valid
  end
  
  describe "add new answer" do
    it "has none to begin with" do
      expect(Answer.count).to eq(0)
    end

    it "has one after adding one" do
      Answer.create!(reference_code: SecureRandom.uuid)
      expect(Answer.count).to eq(1)
    end

    it "has none after one was created in a previous example" do
      expect(Answer.count).to eq(0)
    end
  end
end
