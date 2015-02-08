require 'board'

describe Board do
  let(:board){ Board.new 2 }
  describe '#new' do
    it 'is a hash' do
      expect(board.poles).to be_a_kind_of Hash
    end
    it 'has three poles' do
      expect(board.poles.count).to be 3
    end
    it 'has stack of the correct height on the left pole' do
      expect(board.poles[:l].length).to be 2
    end
  end
  describe 'moves' do
    it 'allows tiles to be moved between poles' do
      board.move({from: :l, to: :c})
      expect(board.poles[:l]).to eq [2]
      expect(board.poles[:c]).to eq [1]
    end
  end
  describe '#winning?' do
    context 'is true when' do
      it 'tiles are properly stacked on the center pole' do
        board.move({from: :l, to: :r})
        board.move({from: :l, to: :c})
        board.move({from: :r, to: :c})
        expect(board.winning?).to be true
      end
      it 'tiles are properly stacked on the right pole' do
        board.move({from: :l, to: :c})
        board.move({from: :l, to: :r})
        board.move({from: :c, to: :r})
        expect(board.winning?).to be true
      end
    end
    context 'is false when' do
      it 'tiles are properly stacked on the left pole' do
        expect(board.winning?).to be false
      end
      it 'tiles are improperly stacked on the center pole' do
        2.times { board.move({from: :l, to: :c}) }
        expect(board.winning?).to be false
      end
      it 'tiles are improperly stacked on the right pole' do
        2.times { board.move({from: :l, to: :r}) }
        expect(board.winning?).to be false
      end
    end
  end
end