require 'player'
require 'human'

describe Human do

  let( :human ){ Human.new }

  describe '#set_dice' do
    it 'raises TypeError if player doesn\'t input a number' do
      expect{human.set_dice("a")}.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError unless player inputs positive number' do
      expect{human.set_dice(0)}.to raise_error(ArgumentError)
    end

    it 'properly sets dice constant' do
      human.set_dice(2)
      expect(human.dice).to eq(2)
    end
  end
end