require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { described_class.new(reference_code: SecureRandom.uuid) }

  it "is not valid without reference_code" do
    subject.reference_code = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if reference_code is not unique" do
    create :answer, :duplicate_answer

    subject.reference_code = "code"
    expect(subject).to_not be_valid
  end
  
  describe "add new answer" do
    it "has none to begin with" do
      expect(Answer.count).to eq(0)
    end

    it "has one after adding one" do
      create :answer, :blank_answer
      expect(Answer.count).to eq(1)
    end

    it "has none after one was created in a previous example" do
      expect(Answer.count).to eq(0)
    end

    describe "start section" do
      before { subject.save! }

      it "saves answers" do
        expect(subject.save_answer(section: :details, question: :which_educational_stage, answer: "secondary school"))
      end
    end
  end
end
