RSpec.describe DiceThrower::Human do
  let(:human) { DiceThrower::Human.new }

  describe '#initialize' do
    it 'has a default name of you' do
      expect(human.name).to eq('you')
    end

    it 'sets to a custom name' do
      human = DiceThrower::Human.new('Jacob')

      expect(human.name).to eq('Jacob')
    end

    it 'has a default dice' do
      expect(human.instance_variable_get(:@dice)).to be_a DiceThrower::Dice
    end

    it 'takes a dice' do
      dice = double('dice')
      human = DiceThrower::Human.new('Joe', dice)
      expect(human.instance_variable_get(:@dice)).to be dice
    end
  end

  describe '#roll_dice' do
    it 'asks the user for a number of dices to throw' do
      expect(human).to receive(:ask).with('Enter number of dice to throw >', Integer).and_return(0)
      human.roll_dice
    end

    it 'rolls dice times the user entered' do
      allow(human).to receive(:ask).and_return(3)
      dice = human.instance_variable_get(:@dice)
      expect(dice).to receive(:roll).exactly(3).times
      human.roll_dice
    end
  end

  describe '#dices_rolled' do
    it 'returns dices rolled' do
      dice = double('dice')
      allow(dice).to receive(:roll).and_return(4, 5, 6)

      human = DiceThrower::Human.new('Joe', dice)
      allow(human).to receive(:ask).and_return(3)
      
      human.roll_dice
      expect(human.dices_rolled).to eq [4, 5, 6]
    end
  end
end
