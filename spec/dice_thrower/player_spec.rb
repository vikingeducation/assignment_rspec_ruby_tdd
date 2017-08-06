RSpec.describe DiceThrower::Player do
  let(:player) { DiceThrower::Player.new('Jacob') }

  describe '#initialize' do
    it 'sets to a custom name' do
      player = DiceThrower::Player.new('Jacob')

      expect(player.name).to eq('Jacob')
    end

    it 'has a default dice' do
      expect(player.instance_variable_get(:@dice)).to be_a DiceThrower::Dice
    end

    it 'takes a dice' do
      dice = double('dice')
      player = DiceThrower::Player.new('Joe', dice)
      expect(player.instance_variable_get(:@dice)).to be dice
    end
  end

  describe '#roll_dice' do
    it 'rolls dice times the number given' do
      dice = player.instance_variable_get(:@dice)
      expect(dice).to receive(:roll).exactly(3).times
      player.roll_dice(3)
    end
  end

  describe '#dices_rolled' do
    it 'returns dices rolled' do
      dice = double('dice')
      allow(dice).to receive(:roll).and_return(4, 5, 6)

      player = DiceThrower::Player.new('Joe', dice)

      player.roll_dice(3)
      expect(player.dices_rolled).to eq [4, 5, 6]
    end
  end
end
