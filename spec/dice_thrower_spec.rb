require 'dice_thrower'

describe DiceThrower do

  let(:dice_thrower) { DiceThrower.new(human_double,computer_double) }
  let(:human_double) { double("human") }
  let(:computer_double) { double("computer") }

  describe '#play' do
    it 'asks the player for their number' do
      allow(dice_thrower).to receive(:quit?).and_return(true)
      expect(human_double).to receive(:roll)
      dice_thrower.play
    end
  end

  describe '#quit?' do
    it 'returns true when the game has been quit' do
      dice_thrower.quit!
      expect(dice_thrower.quit?).to eq(true)
    end

    it 'returns false when the game has not been quit' do
      expect(dice_thrower.quit?).to eq(false)
    end
  end

  describe "#last_player_number" do
    it "should return the number of the last player's selection" do
      dice_thrower.last_player_number = 5
      expect(dice_thrower.last_player_number).to eq(5)
    end
  end
end
