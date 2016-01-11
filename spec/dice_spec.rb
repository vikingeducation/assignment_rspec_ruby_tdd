require 'dice'

describe Dice do
  it 'is a dice' do
    expect(subject).to be_a(Dice)
  end

  let(:dice) { Dice.new }
  let(:roll_count) { 16 }

  describe '#initialize' do
    it 'initializes instance variable with array of values from 1 to 6' do
      expect(dice.instance_variable_get(:@faces)).to eq([1,2,3,4,5,6])
    end
  end

  describe '#roll' do
    it 'returns a random value between 1 and 6 inclusive' do
      expect(dice.roll).to be_between(1,6).inclusive
    end
  end

  describe '.roll_times' do
    it 'raises ArgumentError if argument is not a Fixnum' do
      expect{Dice.roll_multiple("hallo")}.to raise_error(ArgumentError, "Not an integer!")
    end

    it 'raises ArgumentError if argument is not positive' do
      expect{Dice.roll_multiple(-10)}.to raise_error(ArgumentError, "Must be positive!")
    end

    it 'calls roll N times' do
      allow_any_instance_of(Dice).to receive(:roll).and_return(2)
      expect_any_instance_of(Dice).to receive(:roll).exactly(roll_count).times
      Dice.roll_multiple(roll_count)
    end

    it 'returns a sum of N rolls' do
      N = 16
      min = 16
      max = 16 * 6
      allow_any_instance_of(Dice).to receive(:roll).and_return((1..6).to_a.sample)
      expect(Dice.roll_multiple(N)).to be_between(min, max).inclusive
      Dice.roll_multiple(N)
    end
  end
end
