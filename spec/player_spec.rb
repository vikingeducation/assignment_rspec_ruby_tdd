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

  describe '#half_score!' do
    it "should increase the score by 0.5" do
      player.half_score!
      expect(player.score).to eq(0.5)
    end
  end

  describe '#last_roll' do
    it 'returns the value of the last roll' do
      allow(dice_double).to receive(:roll).and_return(5,3,8)
      allow(player).to receive(:ask_for_number)
      player.roll
      player.roll
      expect(player.last_roll).to eq 3
    end
  end
end
