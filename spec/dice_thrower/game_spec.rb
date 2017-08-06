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
end
