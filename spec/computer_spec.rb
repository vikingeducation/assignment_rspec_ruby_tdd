require 'computer'

describe "Computer" do 

  let(:player){Player.new}  
  let(:computer){Player.build_computer}

  describe "check that Computer is initialized" do
    
    it "initializes the Computer object " do
        expect(computer).to be_an_instance_of(Computer)
    end 

    it "initializes number of wins to 0 " do
        expect(computer.wins).to eq(0)
    end 

    it "initializes score to 0 " do
        expect(computer.score).to eq(0)
    end  

    it "initializes type to computer " do
        expect(computer.type).to eq("computer")
    end  
  end


 describe "correctly generates how many dice to play with" do

    it "generates the number of dice corretly" do
      expect(computer.ask_how_many_dice?(6)).to cover(1..6)
      expect(computer.ask_how_many_dice?(10)).to cover(1..10)
    end  
end  