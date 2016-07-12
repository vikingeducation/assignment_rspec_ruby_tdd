require_relative '../lib/dice_thrower'
require 'spec_helper'

describe Dice do


  let(:d){Dice.new}

  describe '#roll' do

    it 'rolls a die 1-6' do
      expect(d.roll).to be < 7
    end
  end
end

describe Player do


  let(:p){Player.new("hello")}

  describe '#rolling' do
    it 'a dice is rolled' do
      allow(p).to receive(:puts)
      allow(p).to receive(:points)
      p.rolling
    end
  end

  describe '#sum' do
    it 'returns the sum of the array' do
      p.points = [1,2,3]
      expect(p.sum).to eq(6)
    end
  end

end

describe Game do

  let(:g){Game.new}

  describe '#throw' do
    it 'receives input from player' do
      allow(g).to receive(:gets).and_return(2)
      g.throw
    end

    it 'is in loop and both palyers are rolling die' do
      
      allow(g.user).to receive(:rolling).and_return(3)
      expect(g.user).to receive(:rolling)
      allow(g.computer).to receive(:rolling).and_return(3)
      expect(g.computer).to receive(:rolling)

      g.throw
    end

  end

end