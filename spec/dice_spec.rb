# spec/dice_spec.rb

require 'dice'
include DiceThrower

describe "Dice" do
  let (:dice) { Dice.new }

  describe "#initialize" do
    it "creates an instance of Dice" do
      expect(dice).to be_a(Dice)
    end
  end

  describe "#roll" do
    it "returns a value from 1 to 6" do
      expect([1, 2, 3, 4, 5, 6]).to include(dice.roll)

      test_rolls = []
      100000.times do
        test_rolls.push(dice.roll)
      end

      expect(test_rolls.all? { |roll| [1, 2, 3, 4, 5, 6].include?(roll) })
    end
  end
end