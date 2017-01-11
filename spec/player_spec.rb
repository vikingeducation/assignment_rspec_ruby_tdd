require 'player'

describe Player do
  describe '#initialize' do
    let(:ai){ Player.new('AI')}

    it 'should be a player' do
      expect(subject).to be_a(Player)
    end

    it 'should have the default name Player 1' do
      expect(subject.name).to eq('Player 1')
    end

    it 'passing a name sets the name of the player' do
      expect(ai.name).to eq('AI')
    end

    it 'passing wins sets the wins for the player' do
      expect(Player.new('Winner', 10).wins).to eq(10)
    end

    it 'should have default wins value of 0' do
      expect(subject.wins).to eq(0)
    end

  end

  describe '#wins=' do
    it 'wins can be overwritten' do
      subject.wins = 12
      expect(subject.wins).to eq(12)
    end
  end

  describe '#throw_dice(num)' do

    it 'must take an int' do
      expect{subject.throw_dice}.to raise_error(ArgumentError)
    end

    it 'returns a number that makes sense for x number of 6-sided dice' do
      5.times do
        expect(subject.throw_dice(5)).to be_between(5, 30).inclusive
        expect(subject.throw_dice(4)).to be_between(4, 24).inclusive
        expect(subject.throw_dice(3)).to be_between(3, 18).inclusive
        expect(subject.throw_dice(2)).to be_between(2, 12).inclusive
        expect(subject.throw_dice(1)).to be_between(1, 6).inclusive
      end
    end

  end

  describe '#name accessors' do
    it 'name can be read' do
      expect(subject.name).to eq('Player 1')
    end
    it 'name cannot be set after init' do
      expect{ subject.name = 'Phoenix'}.to raise_error(NoMethodError)
    end
  end

  describe '#reset_dice_throw' do
    it 'resets dice_throw ' do
      subject.instance_variable_set(:@dice_throw, 5)
      subject.reset_dice_throw
      expect(subject.instance_variable_get(:@dice_throw)).to eq(0)

    end
  end


end
