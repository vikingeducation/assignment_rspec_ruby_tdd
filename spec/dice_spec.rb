# rspec/dice_spec.rb
require 'dice'

describe 'Dice' do 
  let(:dice){Dice.new(6)}

  describe "#intialize" do
    it "#intializes a Dice of type dice" do
      expect(dice).to be_a(Dice)
    end

    it "#stores the initialized number of sides" do
      expect(dice.sides).to eq(6)
    end

    it "#initializes a 6 sided dice even if no number is supplied" do
      dice_without_n = Dice.new
      expect(dice_without_n.sides).to eq(6)
    end
  end

  describe "roll dice" do
    it "generates a random number between 1 and 6 when the dice is thrown" do
      expect(dice.roll_dice).to be_between(1,6).inclusive
    end
  end
end