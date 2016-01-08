require 'player'
require 'dice'
require 'spec_helper'

describe Player do

  let(:dice_double) { instance_double("Dice")}
  let(:player) { Player.new(dice: dice_double) }

  describe '#ask_for_number' do
    it 'returns a number from the player' do
      allow(player).to receive(:gets).and_return('5')
      expect(player.ask_for_number).to eq 5
    end

    it 'returns false if the player enters quit' do
      allow(player).to receive(:gets).and_return('quit')
      expect(player.ask_for_number).to eq false
    end

    it 'asks until the number is between 1 and 6' do
      allow(player).to receive(:gets).and_return('0', '-4', '8', '6')
      expect(player.ask_for_number).to eq 6
    end
 end

  describe '#roll' do
    it 'rolls dice' do
      allow(dice_double).to receive(:roll)
      expect(dice_double).to receive(:roll)

      player.roll
    end
  end
end
