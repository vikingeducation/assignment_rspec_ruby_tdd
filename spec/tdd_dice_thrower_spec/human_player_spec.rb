require 'tdd_dice_thrower/human_player'

describe HumanPlayer do 

  let(:player) { HumanPlayer.new('Mike') }

  describe "#initialize" do 
    it "should take one argument" do 
      expect{HumanPlayer.new}.to raise_error(ArgumentError)
    end
  end

  describe "#select_number_of_dice" do 
    it "gets number of dice from the user" do 
      allow(player).to receive(:gets).and_return('5')
      expect(player.select_number_of_dice).to eq(5)
    end
  end

  describe "#roll_dice" do 
    it "creates a @number_of_dice-sized Array" do 
      expect(player.roll_dice(5).size).to eq(5)
    end
  end
end