require 'dice_thrower'
require 'player'
require 'human'
require 'computer'

describe DiceThrower do
  let( :game ){ DiceThrower.new }

  describe '#initialize' do
    it 'initializes with player 1 as human' do
      expect(game.player1).to be_an_instance_of(Human)
    end
  end

  describe '#game' do
    it 'breaks when player enters q' do
      allow(game).to receive(:gets).and_return('q')
      expect(game.game).to eq(nil)
    end
  end
end