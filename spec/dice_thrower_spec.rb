require 'spec_helper'
require 'dice_thrower'

describe 'Die' do
  d = Die.new
  it 'is a die' do
    expect(d).to be_a(Die)
  end
  describe '#.val' do
    it 'generates a random integer value' do
      expect(d.val).to be_a(Integer)
    end
  end
end

describe Game do
  g = Game.new
  describe '#get_num_dice' do
    before do
      allow(g).to receive(:puts)
    end
    it 'calls gets.chomp' do
      allow(g).to receive(:gets).and_return("2")
      # allow(gets).to receive(:chomp)
      expect(g).to receive(:gets).and_return("2")
      g.get_num_dice
    end

    it 'calls valid_input?' do
      allow(g).to receive(:gets).and_return("2")
      expect(g).to receive(:valid_input?).and_return(true)
      g.get_num_dice
    end

    it 'calls end_game' do
      allow(g).to receive(:gets).and_return("3")
      expect(g).to receive(:end_game).with("3")
      g.get_num_dice
    end

    it 'returns the inputted number of dice' do
      allow(g).to receive(:gets).and_return("8")
      expect(g.get_num_dice).to eq(8)
    end
  end

  # describe '#end_game' do
  #   it 'ends the game if the player types "q"' do
  #     expect(g.end_game("q")).to receive(:exit)
  #   end
  # end
  describe '#valid_input?' do
    it 'returns true if input is integer' do
      expect(g.valid_input?(1)).to eq(true)
    end

    it 'returns false if input is <= 0' do
      expect(g.valid_input?(0)).to eq(false)
    end
  end

  describe '#det_outcome' do
    it
  end
end

describe Score do
  s = Score.new
  describe '#initialize' do
    it 'initializes a player and computer score of 0' do
      expect(s.player).to eq(0)
      expect(s.comp).to eq(0)
    end
  end
  describe '#player' do
    it 'updates the player\'s score' do
      s.player += 1
      expect(s.player).to eq(1)
    end
  end

end
