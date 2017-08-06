RSpec.describe DiceThrower::Game do
  describe '#initalize' do
    let(:game) { DiceThrower::Game.new }

    it 'sets up a computer player and human' do
      expect(game.instance_variable_get(:@computer)).to be_a DiceThrower::Computer
      expect(game.instance_variable_get(:@human)).to be_a DiceThrower::Human
    end

    it 'sets up a score' do
      expect(game.instance_variable_get(:@score)).to be_a DiceThrower::Score
    end
  end

  describe '#throw' do
    before { allow($stdout).to receive(:puts) }
    let(:human) { double(roll_dice: nil, quit?: true, name: nil, dices_rolled: []) }
    let(:computer) { double(name: nil, dices_rolled: []) }
    let(:game) { DiceThrower::Game.new(computer, human) }

    it 'displays instructions' do
      expect {game.throw }.to output(/Welcome to Dice Thrower/).to_stdout
    end

    it 'asks human to roll dice' do
      expect(human).to receive(:roll_dice)
      game.throw
    end

    context 'Human quits' do
      it 'ends the game' do
        expect {game.throw }.to output(/Have a nice day!/).to_stdout
      end
    end

    context 'Human rolls dice' do
      before do
        allow(human).to receive(:dices_rolled).and_return([1, 2])
        allow(human).to receive(:quit?).and_return(false, true)
      end

      it 'computer rolls dice' do
        expect(computer).to receive(:roll_dice).with(2)
        game.throw
      end

      it 'updates score' do
        allow(computer).to receive(:roll_dice).with(2)
        expect(game.instance_variable_get(:@score)).to receive(:update)
        game.throw
      end
    end
  end
end
