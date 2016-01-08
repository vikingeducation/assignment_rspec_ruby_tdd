require 'dice'

describe Dice do

  let(:dice) {Dice.new}

  describe "#roll_dice" do
    it "returns an integer" do
      expect(dice.roll(4)).to be_a Integer
    end

    it "rolls one die" do
      100.times do
        expect(1..6).to cover(dice.roll(1))
      end
    end

    it "rolls two dice" do
      100.times do
        expect(2..12).to cover(dice.roll(2))
      end
    end
  end
end
