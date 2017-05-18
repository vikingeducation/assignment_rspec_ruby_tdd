require 'game'
describe Game do
  let(:game) {Game.new}
  let(:player1) {Player.new}
  let(:conrad) {Player.new}
  before(:each) do
    allow(game).to receive(:number).and_return(2)
    allow(game).to receive(:ask_to_quit).and_return(true)
  end

  describe '#init' do
    it 'creates a new instance of the Game class' do
      expect(game).to be_a(Game)
    end
    it 'creates a new instance of a Human player' do
      expect(player1).to be_a(Player)
    end
    it 'creates a new instance of a Computer player' do
      expect(conrad).to be_a(Player)
    end
  end

  describe '#play' do
    it 'calls #info' do
      expect(game).to receive(:info)
      game.play
    end

    it 'calls #render' do
      expect(game).to receive(:render)
      expect(game).to receive(:render)
      game.play
    end
  end

end # end Game
