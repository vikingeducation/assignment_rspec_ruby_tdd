
require 'game'

describe "Game" do 
  let(:game){ Game.new }
  # let(:file){ File.new }

  describe "check that game is initialized" do
    it "initializes the Dice object" do
        expect(game.dice.is_a?).to eq(Dice)
    end 

    it "initializes the Human object" do
        expect(game.human.is_a?).to eq(Human)
    end 

    it "initializes the Computer object" do
        expect(game.computer.is_a?).to eq(Computer)
    end 

  end
end   