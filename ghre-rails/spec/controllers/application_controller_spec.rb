require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  describe "#current_user" do
    describe "when user has not started an answer" do
      it "returns nil" do
        expect(subject.current_user).to be_nil
      end
    end
    describe "when user has started an answer" do
      before do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { answer_id: 1 } }
        allow(Answer).to receive(:find).and_return(Answer.new(reference_code: SecureRandom.uuid))
      end

      it "returns an answer" do
        expect(subject.current_user).to be_a(Answer)
      end
    end
  end
end
