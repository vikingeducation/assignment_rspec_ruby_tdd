RSpec.describe DiceThrower::Dice do
  describe '#initialize' do
    it 'defaults to six sides' do
      dice = DiceThrower::Dice.new

      expect(dice.sides).to be 6
    end

    it 'sets the sides to given amount' do
      dice = DiceThrower::Dice.new(4)

      expect(dice.sides).to be 4
    end
  end

  describe '#roll' do
    it 'returns the number of the dice' do
      allow_any_instance_of(DiceThrower::Dice).to receive(:rand).and_return(4)

      expect(DiceThrower::Dice.new.roll).to be 4
    end

    it 'generates random numbers from 1 to 6' do
      dice = DiceThrower::Dice.new
      rolles = (0..100).map { dice.roll }

      expect(rolles.minmax).to eq [1, 6]
    end

    it 'generates random numbers from 1 to 10' do
      dice = DiceThrower::Dice.new(10)
      rolles = (0..100).map { dice.roll }

      expect(rolles.minmax).to eq [1, dice.sides]
    end
  end
end
