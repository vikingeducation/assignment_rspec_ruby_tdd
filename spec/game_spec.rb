require 'game'
describe Game do
  let(:game) {Game.new}
  before(:each) do
    allow(game).to receive(:number).and_return(2)
    allow(game).to receive(:ask_to_quit).and_return("q")
  end

  describe '#init' do
    it 'creates a new instance of the Game class' do
      expect(game).to be_a(Game)
    end
  end

  describe '#play' do
    it 'calls #info' do
      expect(game).to receive(:info)
      game.play
    end

    it 'calls #render' do
      expect(game).to receive(:render)
      game.play
    end

    it 'calls #evaluate_answer to quit or not' do
      expect(game).to receive(:evaluate_answer)
      game.play
    end
  end

end # end Game
