# rspec/player_spec.rb
require 'player'

describe Player do
  let(:player){Player.new}

  describe '#initialize' do
    it 'creates a player of type player' do
      expect(Player.new).to be_a Player
    end

    it 'it raises an error if a player is initialized with a parameter' do
      expect{(Player.new("Me"))}.to raise_error(ArgumentError)
    end
  end

  describe 'dice' do
    it 'returns the stored number of die' do
      expect(player.no_of_dice(5)).to eq(player.num_dice)
    end
  end

  describe '#roll_dice' do
    it 'expect the player total to more than or qual to 4 and less than or equal to 24 with 4 dice' do
      # expect(player.roll(4)).to eq(player.num_dice)
      player.roll(4)
      expect(player.total).to be_between(4,24).inclusive
    end
  end
end