require 'tdd_dice_thrower/human_player'

describe HumanPlayer do 

  let(:player) { HumanPlayer.new }

  describe "#select_number_of_dice" do 
    it "gets number of dice from the user" do 
      allow(player).to receive(:gets).and_return('5')
      expect(player.select_number_of_dice).to eql(5)
    end
  end

  describe "#roll_dice" do 
    before do 
      allow(player).to receive(:gets).and_return('5')
      player.select_number_of_dice
    end
    it "creates a @number_of_dice-sized Array" do 
      expect(player.roll_dice.size).to eql(5)
    end
  end
end