require 'dice_dice'
describe Dice do
  let(:die) {Dice.new}
  describe '#init' do
    it 'creates a new instance of a die' do
      expect(die).to be_an_instance_of(Dice)
    end
  end
  describe '#single_roll' do
    it 'randomly selects integer between 1 and 6' do
      expect(die.single_roll).to be_between(1, 6).inclusive
    end
  end
end
