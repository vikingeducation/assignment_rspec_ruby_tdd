require 'player'
require 'computer'
require 'human'

describe "Player" do 
  let(:player){Player.new}
  let(:computer){Player.build_computer}
  let(:human){Player.build_human}

  describe "check that Player is initialized" do
    
    it "initializes the Player object " do
        expect(player).to be_an_instance_of(Player)
    end 

    it "initializes number of wins to 0 " do
        expect(player.wins).to eq(0)
    end 

    it "initializes score to 0 " do
        expect(player.score).to eq(0)
    end  

  end

  describe "correctly updates the wins for player" do
    it "correctly updates the wins for computer" do
        player.wins = 10
        expect(player.wins).to eq(10)
    end

    it "correctly updates the score for player" do
        player.score = 27
        expect(player.score).to eq(27)
    end

    it "adds a win to computer when computer has higher score" do
        computer.score = 20
        human.score = 10
        computer.wins = 10
        human.wins = 10
        computer.get_winner(human)
        expect do 
          (computer.wins).to change_by(1)
          (computer.wins).to change_by(0)
        end  
    end

    it "adds a multiple wins to computer when computer has higher score" do
        computer.score = 20
        human.score = 10
        computer.wins = 10
        human.wins = 10

        computer.get_winner(human)
        computer.get_winner(human)
        
        expect do 
          (computer.wins).to change_by(2)
          (computer.wins).to change_by(0)
        end  
    end

    it "adds a win to human when human has higher score" do
        human.score = 20
        computer.score = 10
        human.wins = 10
        computer.wins = 10
        
        human.get_winner(computer)
        
        expect do 
          (human.wins).to change_by(1)
          (computer.wins).to change_by(0)
        end  
    end

    it "adds a multiple wins to human when human has higher score" do
        computer.score = 10
        human.wins = 10
        computer.wins = 10

        human.get_winner(computer)
        human.get_winner(computer)
        
        expect do 
          (human.wins).to change_by(2)
          (computer.wins).to change_by(0)
        end  
    end
  end
end  