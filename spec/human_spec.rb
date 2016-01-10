
require 'human'

describe "Human" do 

  let(:player){Player.new}  
  let(:human){Player.build_human}

  describe "check that Human is initialized" do
    
    it "initializes the Human object " do
        expect(human).to be_an_instance_of(Human)
    end 

    it "initializes number of wins to 0 " do
        expect(human.wins).to eq(0)
    end 

    it "initializes score to 0 " do
        expect(human.score).to eq(0)
    end  

    it "initializes type to human " do
        expect(human.type).to eq("human")
    end  
  
  end

  describe "correctly generates how many dice to play with" do
   
    it "generates the number of dice corretly" do

       allow(human).to receive(:gets).and_return("0","-1","x","7","6")
       allow(human).to receive(:print)

       human.ask_how_many_dice?(6)
       human.ask_how_many_dice?(6)
       human.ask_how_many_dice?(6)
       human.ask_how_many_dice?(6)
       expect(human.ask_how_many_dice?(6)).to eq (6)
    end 
 
  end

end