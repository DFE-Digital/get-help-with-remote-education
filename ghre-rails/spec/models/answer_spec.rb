require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { described_class.create(reference_code: SecureRandom.uuid) }

  describe "validations" do
    it "is not valid without reference_code" do
      subject.reference_code = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if reference_code is not unique" do
      create :answer, :duplicate_answer

      subject.reference_code = "code"
      expect(subject).to_not be_valid
    end
  end
  
  describe "#save_answer" do
    context "Leadership" do
      it "allows you to submit answers for leadership questions" do
        subject.submit_answer(
          section: :leadership,
          question: :remote_education_plan,
          answer: 1
        )

        expect(subject.leadership.remote_education_plan).to eq(1)
      end

      it "allows you to update the answer" do
        subject.submit_answer(
          section: :leadership,
          question: :remote_education_plan,
          answer: 1
        )

        subject.submit_answer(
          section: :leadership,
          question: :remote_education_plan,
          answer: 2
        )

        expect(subject.leadership.remote_education_plan).to eq(2)
      end
    end
  end
end
