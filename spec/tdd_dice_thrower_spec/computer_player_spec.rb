require 'tdd_dice_thrower/computer_player'
require 'tdd_dice_thrower/human_player'

describe 'ComputerPlayer' do 

  let(:comp_player) { ComputerPlayer.new }
  let(:hum_player) { HumanPlayer.new }


  describe "#roll_dice" do 
    before do 
      allow(hum_player).to receive(:gets).and_return('5')
      hum_player.select_number_of_dice
    end

    it "creates a number_of_dice-sized Array" do 
      expect(comp_player.roll_dice.size).to eql($number_of_dice)
    end
  end
end