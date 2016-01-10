
require 'game'

describe "Game" do 
  let(:game){ Game.new }
  let(:game2){ Game.new }

  describe "check that game is initialized" do
    it "initializes the Dice object" do
        expect(game.dice).to be_an_instance_of(Dice)
    end 

    it "initializes the Human object" do
        expect(game.human.class).to eq(Human)
    end 

    it "initializes the Computer object" do
        expect(game.computer.class).to eq(Computer)
    end 

  end

  describe "check for correct human or computer turn" do
    it "picks human or computer for current player in the beginning" do
        expect([game.computer,game.human]).to include(game.start_turn)
    end
    it "picks human or computer for current player again!" do
        expect([game.computer,game.human]).to include(game.start_turn)
    end
  end

  describe "check for correct human or computer opponent" do 
  
    it "raises error if incorrect current player class passed to get its opponent" do
        expect {game.get_opponent("cc")}.to\
        raise_error(Game::ERRORS["wrong_current_player"])
    end  

    it "raises ArgumentError if incorrect no of arguments passed to get_opponent" do
        expect {game.get_opponent}.to raise_error(ArgumentError)
    end  

    it "gets the correct opponent as computer for human player" do
        expect(game.get_opponent(game.human)).to be(game.computer)
    end 

    it "gets the correct opponent as human for computer player" do
        expect(game.get_opponent(game.computer)).to be(game.human)
    end  
  end

end 