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
      expect(human).to receive(:ask).with('Enter number of dice to throw >', any_args).and_return(0)
      human.roll_dice
    end

    it 'does not roll dice if user enters q' do
      allow(human).to receive(:ask).and_return('q')
      expect_any_instance_of(DiceThrower::Dice).not_to receive(:roll)
    end
  end

  describe '#quit?' do
    it 'defaults to false' do
      expect(human.quit?).to be false
    end

    it 'is true when user enters q' do
      allow(human).to receive(:ask).and_return('q')
      human.roll_dice
      expect(human.quit?).to be true
    end
  end
end
