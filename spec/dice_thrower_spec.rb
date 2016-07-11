#ask user how many dice they would like to throw
#throw that many dice and record result
#throw same number of dice for computer and record result
#compare results



require 'dice_thrower'

describe DiceThrower do

  describe Game do

    describe "#initialize" do
      it "makes a player" do
      end

      it "makes a computer" do
      end
    end

    describe "#play" do
      it "asks for number of dice" do 
      end

      it "calls player action" do
      end

      it "calls computer action" do
      end

      it "outputs the result of the round" do
      end 

      it "outputs the total score" do
      end
    end
  end

  describe Player do
    describe "#initialize" do
      it "sets wins to 0" do
      end

      it "creates an empty array of dice" do
      end
    end

    describe "set number of dice" do
      it "outputs prompt for number of dice" do
      end

      it "verifies user input"do
      end

      it "return the number of dice" do 
      end
     end

     describe "roll dice" do
      it "changes the results of the dice" do
      end
      it "returns the sum of the dice values" do
      end
     end
  end

end

#Game Class
#makes a player and a computer
#play loop until quit

#Player Class
#choose number of dice
#@score
#Prompt player for number of dice

#Computer Class
#@score

#Dice Class
#roll
#@value

#View Class
#print something