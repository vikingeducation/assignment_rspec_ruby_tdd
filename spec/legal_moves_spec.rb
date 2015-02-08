require 'legal_moves'
require 'board'

describe LegalMoves do
  let(:l){ LegalMoves.new( Board.new 2 )}
  describe '#new' do
    it 'has access to the game board' do
      expect(l.board).to be_a_kind_of Board
    end
  end
  describe '#is_legal?' do
    context 'allowed moves' do
      it 'allows higher-to-lower value moves' do
        l.board.move({from: :l, to: :c})
        l.board.move({from: :l, to: :r})
        expect(l.is_legal?({from: :c, to: :r})).to be true
      end
    end
    context 'disallowed moves' do
      it 'disallows lower-to-higher value moves' do
        l.board.move({from: :l, to: :c})
        expect(l.is_legal?({from: :l, to: :c})).to be false
      end
      it 'disallows moves from empty poles' do
        expect(l.is_legal?({from: :c, to: :r})).to be false
      end
      it 'disallows moves to the same pole' do
        expect(l.is_legal?({from: :l, to: :l})).to be false
      end
    end
  end
end