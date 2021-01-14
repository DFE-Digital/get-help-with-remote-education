require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "add new answer" do
    it "has none to begin with" do
      expect(Answer.count).to eq(0)
    end

    it "has one after adding one" do
      Answer.create!
      expect(Answer.count).to eq(1)
    end

    it "has none after one was created in a previous example" do
      expect(Answer.count).to eq(0)
    end
  end
end
