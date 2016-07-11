#ask user how many dice they would like to throw
#throw that many dice and record result
#throw same number of dice for computer and record result
#compare results



require 'dice_thrower'

describe DiceThrower do

  describe Game do
    let(:h) { double(get_number_of_dice: 3, create_dice: true, roll: 10, win: true, quit?: true) }
    let(:c) { double(create_dice: true, roll: 8, win: true) }
    let(:game) { Game.new(h, c) }

    describe "#initialize" do
      it "makes a player" do

      end

      it "makes a computer" do

      end
    end

    describe "#play" do
      it "asks for number of dice" do 
        expect(h).to receive(:get_number_of_dice).and_return(3)
        game.play
      end

      it "calls player roll" do
        expect(h).to receive(:roll)
        game.play
      end

      it "calls computer roll" do
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

#Human Class < Player
#@score

#Dice Class
#roll
#@value

#View Class
#print something