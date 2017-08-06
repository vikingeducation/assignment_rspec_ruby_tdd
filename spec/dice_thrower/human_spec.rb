RSpec.describe DiceThrower::Human do
  let(:human) { DiceThrower::Human.new }

  describe '#initialize' do
    it 'inherits from Player' do
      expect(human).to be_a DiceThrower::Player
    end
    it 'has a default name of you' do
      expect(human.name).to eq('you')
    end
  end

  describe '#roll_dice' do
    it 'asks the user for a number of dices to throw' do
      expect(human).to receive(:ask).with('Enter number of dice to throw >', Integer).and_return(0)
      human.roll_dice
    end
  end
end
