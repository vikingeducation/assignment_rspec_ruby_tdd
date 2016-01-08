require 'player'
require 'dice'
require 'spec_helper'

describe Player do

  let(:dice_double) { instance_double("Dice")}
  let(:player) { Player.new(dice: dice_double) }

  describe '#initialize' do
    it "initializes with score 0" do
      expect(player.score).to eq 0
    end
  end

  describe '#roll' do
    it "rolls the dice" do
      allow(player).to receive(:ask_for_number).and_return 3
      expect(dice_double).to receive(:roll).with 3
      player.roll
    end
  end

  describe '#score!' do
    it "should increase the score by 1" do
      player.score!
      expect(player.score).to eq(1)
    end
  end
end
