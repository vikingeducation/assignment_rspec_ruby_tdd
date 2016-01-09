require 'player'
require 'human'

describe Human do

  let( :human ){ Human.new }

  describe '#set_dice' do
    it 'raises TypeError if player doesn\'t input a number' do
      allow(human).to receive(:gets).and_return('e')
      expect{human.set_dice}.to raise_error(TypeError)
    end

    it 'raises ArgumentError unless player inputs positive number' do
      allow(human).to receive(:gets).and_return('0')
      expect{human.set_dice}.to raise_error(ArgumentError)
    end

    it 'properly sets dice constant' do
      allow(human).to receive(:gets).and_return('2')
      human.set_dice
      expect(human.dice).to eq(2)
    end
  end
end