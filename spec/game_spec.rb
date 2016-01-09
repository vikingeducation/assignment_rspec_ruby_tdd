
require 'game'

describe "Game" do 
  let(:game){ Game.new }
  let(:game2){ Game.new(3) }
  # let(:file){ File.new }

  describe "check that game is initialized" do
    it "initializes the Dice object" do
        expect(game.dice).to eq(1)
    end 

    it "initializes the Human object" do
        expect(game.human.class).to eq(Human)
    end 

    it "initializes the Computer object" do
        expect(game.computer.class).to eq(Computer)
    end 

    it "initializes dice correctly when no of dice is passed" do
        expect(game2.dice).to eq(3)
    end 
  end
end   