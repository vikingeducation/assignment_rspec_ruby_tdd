# rpsec/computer_spec.rb

require 'player'
require 'computer'

describe Computer do
  let(:computer){Computer.new}

  describe '#initialize' do
    it 'creates a player of type player' do
      expect(Computer.new).to be_a Computer
    end

    it 'it raises an error if a player is initialized with a parameter' do
      expect{(Computer.new("Me"))}.to raise_error(ArgumentError)
    end
  end

  describe 'dice' do
    it 'returns the stored number of die' do
      expect(computer.no_of_dice(5)).to eq(computer.num_dice)
    end
  end

  describe '#roll_dice' do
    it 'expect the player total to more than or qual to 4 and less than or equal to 24 with 4 dice' do
      computer.roll(4)
      expect(computer.total).to be_between(4,24).inclusive
    end
  end
end