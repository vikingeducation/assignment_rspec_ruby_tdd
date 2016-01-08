require 'dice_thrower'
require 'human'
require 'computer'


describe DiceThrower do
  let(:dice_thrower) { DiceThrower.new(human_double,computer_double) }
  let(:human_double) { instance_double("Human") }
  let(:computer_double) { instance_double("Computer") }

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

  describe '#compare_rolls' do
    it 'adds to the players score if their roll is greater' do
      expect(human_double).to receive(:score!)
      allow(human_double).to receive(:last_roll).and_return(38)
      allow(computer_double).to receive(:last_roll).and_return(18)
      dice_thrower.compare_rolls
    end

    it 'adds to the computers score if their roll is greater' do
      expect(computer_double).to receive(:score!)
      allow(human_double).to receive(:last_roll).and_return(8)
      allow(computer_double).to receive(:last_roll).and_return(18)
      dice_thrower.compare_rolls
    end

    it 'adds half a point if there is a draw' do
      expect(computer_double).to receive(:half_score!)
      expect(human_double).to receive(:half_score!)
      allow(human_double).to receive(:last_roll).and_return(8)
      allow(computer_double).to receive(:last_roll).and_return(8)
      dice_thrower.compare_rolls
    end
  end
end
