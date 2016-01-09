require 'dice'

describe "Game" do 
  let(:dice){ Dice.new(1) }
  let(:dice2){ Game.new(3) }
  # let(:file){ File.new }

  describe "check that dice is initialized" do
    it "initializes the Dice object " do
        expect(dice.num_dice).to eq(1)
        expect(dice2.num_dice).to eq(1)
    end 
  end

  describe "roll dice" do
    it "roll dice correctly picks a number between 1 and 6" do
        expect(1..6).to cover(dice.roll_dice)
    end 

  end
end   