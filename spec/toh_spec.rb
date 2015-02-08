require 'toh'

describe TowersOfHanoi do
  let(:toh) { TowersOfHanoi.new(2) }
  describe '#new' do
    it 'has a board' do
      expect(toh.board).to be_a_kind_of Board
    end
    it 'has a CLI' do
      expect(toh.cli).to be_a_kind_of CLI
    end
    it 'knows the legal moves' do
      expect(toh.legal_moves).to be_a_kind_of LegalMoves
    end
  end
end