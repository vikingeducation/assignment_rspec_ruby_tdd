require 'dice'

describe Dice do

  let(:d){Dice.new}

  describe 'self.roll' do
    it "should be between 1 and 6" do
      expect((1..6)).to include(Dice.roll)
    end

    it "should return a number between 2 and 12 when given 2 dice" do
      expect(Dice.roll(2)).to be_between(2, 12)
    end
  end
end
