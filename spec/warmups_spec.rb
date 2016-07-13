require 'warmups'
require 'dice_thrower'

# describe '#stock_picker' do

#   it 'raises an error if input is not an array' do
#     expect{stock_picker(5)}.to raise_error(ArgumentError)
#   end

#   it 'raises an error if array is of length one' do
#     expect{stock_picker([1])}.to raise_error(ArgumentError)
#   end

#   it 'raises an error if array contains non-fixnums' do
#     expect{stock_picker(["bananna", "bananna", "bananna"])}.to raise_error(ArgumentError)
#   end

#   it 'raises an error if array is the same throughout' do
#     expect{stock_picker([1, 1, 1, 1, 1])}.to raise_error("There are no profits to be made here")
#   end

#   it 'returns the most profitable days of an array' do
#     expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2,6])
#   end
# end

# describe '#anagrams' do

#   it 'raises an error if its first argument is not a string' do
#     expect{anagrams(1,2)}.to raise_error(ArgumentError)
#   end

#   it 'raises an error if its second argument is not an array' do
#     expect{anagrams('string', 5)}.to raise_error(ArgumentError)
#   end

#   it 'raises an error unless there is a single string inside of the array' do
#     expect{anagrams('string', ["one", "two"])}.to raise_error(ArgumentError)
#   end

#   it 'only returns the words that are anagrams' do
#     expect( anagrams("looter", ["spooky, retool, rootle, tooler, toddler"]) ).to eq(["RETOOL", "ROOTLE", "TOOLER"])
#   end
# end

describe Dice do
  describe '#roll' do
    it 'returns a number between one and six' do
      100.times do
        expect(1..6).to cover(subject.roll)
      end
    end
  end
end

describe Player do
  describe '#get_num_of_dice' do
    it 'returns the num of dice' do
      allow(subject).to receive(:gets).and_return('4')
      expect(subject.get_num_of_dice).to eq(4)
    end
  end

  describe '#play_again?' do
    it 'returns true if user inputs y or yes' do
      allow(subject).to receive(:gets).and_return('y')
      expect(subject.play_again?).to eq(true)
    end

    it 'returns false if user inputs n or no' do
      allow(subject).to receive(:gets).and_return('n')
      expect(subject.play_again?).to eq(false)
    end
  end
end

describe Game do
  let(:player) { double }
  let(:game) { Game.new(player) }
  let(:player_instance) { Player.new }
  describe '#initialize' do
    it 'creates a score array to keep track of scores' do
      expect(subject.score).to be_a(Array)
    end

    it 'makes a call to Player class' do
      expect(player).to receive(:new)
      game
    end
  end

  describe '#get_player_dice' do

    it 'returns an fixnum'do
      allow(player).to receive(:new).and_return( player_instance )
      allow(player_instancse).to receive(:get_num_of_dice).and_return(6)
      expect(game.get_player_dice).to be_a(Fixnum)
    end
  end
end
