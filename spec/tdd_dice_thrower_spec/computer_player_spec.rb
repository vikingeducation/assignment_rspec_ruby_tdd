require 'tdd_dice_thrower/computer_player'
require 'tdd_dice_thrower/human_player'

describe 'ComputerPlayer' do 

  let(:comp_player) { ComputerPlayer.new('Kit') }
  let(:hum_player) { HumanPlayer.new('Mike') }

  describe "#initialize" do 
    it "should take one argument" do 
      expect{ComputerPlayer.new}.to raise_error(ArgumentError)
    end
  end

  describe "#roll_dice" do 
    it "creates a number_of_dice-sized Array" do 
      expect(comp_player.roll_dice(5).size).to eq(5)
    end
  end
end