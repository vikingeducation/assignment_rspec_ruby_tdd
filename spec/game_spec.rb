require 'game'
describe Game do
  let(:game) {Game.new}
  # let(:number_of_dice) {"2"}

  describe '#init' do
    it 'creates a new instance of the Game class' do
      expect(game).to be_a(Game)
    end
  end
  describe '#play' do
    it 'calls #info' do
      allow(:number_of_dice).to receive("2")
      expect(game).to receive(:info)
    end

    it 'calls #render' do
      expect(game).to receive(:render)
    end

  end

end # end Game
